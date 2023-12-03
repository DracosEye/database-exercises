use hippo_ben;

# ONE TO MANY RELATIONSHIP
# One author has many quotes

drop table if exists quotes;

create table quotes (
    id int not null auto_increment,
    author varchar(75),
    content varchar(255),
    primary key (id)
);

insert into quotes (author, content) values ('Neil Gaiman', 'I hope you will have a wonderful year, that you''ll dream dangerously and outrageously, that you''ll make something that didn''t exist before you made it');

insert into quotes (author, content) values ('Neil Gaiman', 'I hope that in this year to come, you make mistakes. Because if you are making mistakes...you''re Doing Something.');

# But we might have a lot of repeat data: author names
# so we create an an authors table

create table authors (
  id int unsigned not null auto_increment,
  name varchar(75),
  primary key (id)
);

insert into authors (name) values ('Neil Gaiman');

# We create an author_id column in the quotes table
# this will be a foreign key

alter table quotes add column author_id int unsigned not null;

update quotes set author_id = (
    select id from authors where name = 'Neil Gaiman'
    )
    where author = 'Neil Gaiman';

# Now we dont' need the author column anymore

alter table quotes drop column author;

# In order to prevent that, we have to formally declare a foreign key constraint

alter table quotes add constraint quotes_author_id_fk foreign key (author_id) references authors(id);

# This is bad at this stage at this stage: there is no author 23, so this would be bad data
insert into quotes (author_id, content) values (23, 'Agua mole em pedra dura, bate bate ate que fura');

# To solve that, we need to add the author to the authors table first

insert into authors (name) values ('Traditional Brazilian Proverb')

insert into quotes (author_id, content) values (
                                                (
                                                    select id from authors where name = 'Traditional Brazilian Proverb'), 'Agua mole em pedra dura, bate bate ate que fura'

                                               );

# Now I can't do this. It would leave bad data in the quotes table
# It would leave author_id in the quotes table that does not correspond to any id in the authors table
delete from authors where name = 'Traditional Brazilian Proverb';
# If I wanted to delete this author, I would have to
# first delete every quote for that author in the quotes table

delete from quotes where author_id = (
    select id from authors where name = 'Traditional Brazilian Proverb'
    );
delete from authors where name = 'Traditional Brazilian Proverb';

# Many to many

create table genres (
    id int unsigned not null auto_increment,
    genre varchar(50),
    primary key (id)
);

insert into genres (genre) values ('inspiration'), ('romantic'), ('for the boys'), ('entertainment');

create table quotes_genres (
    quote_id int not null,
    genre_id int unsigned not null,
    constraint quotes_topics_quote_id_fk foreign key (quote_id) references quotes(id),
    constraint quotes_topics_genre_id_fk foreign key (genre_id) references genres(id)
);

insert into quotes_genres (quote_id, genre_id) values (1, 1), (1, 2), (2, 1), (2, 2);

select quotes.content, authors.name from quotes join authors on quotes.author_id = authors.id
                                    join quotes_genres qg on quotes.id = qg.quote_id
                                    join genres g on qg.genre_id = g.id
where g.genre = 'inspiration';