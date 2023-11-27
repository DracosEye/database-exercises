use hippo_ben;

DROP TABLE IF EXISTS albums;

CREATE TABLE `albums` (
                          `id` int unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
                          `artist` tinytext NOT NULL,
                          `name` tinytext NOT NULL,
                          `release_date` year NOT NULL,
                          `sales` decimal(3,1) unsigned NOT NULL,
  `genre` tinytext NOT NULL
);