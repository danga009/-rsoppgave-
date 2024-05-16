 CREATE TABLE IF NOT EXISTS `tickets` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`title` varchar(255) NOT NULL,
	`msg` text NOT NULL,
	`email` varchar(255) NOT NULL,
	`created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`status` enum('open','closed','resolved') NOT NULL DEFAULT 'open',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `tickets` (`id`, `title`, `msg`, `email`, `created`, `status`) VALUES (1, 'Test Ticket', 'This is your first ticket.', 'support@codeshack.io', '2023-04-02 13:06:17', 'open');

CREATE TABLE IF NOT EXISTS `tickets_comments` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`ticket_id` int(11) NOT NULL,
	`msg` text NOT NULL,
	`created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `tickets_comments` (`id`, `ticket_id`, `msg`, `created`) VALUES (1, 1, 'This is a test comment.', '2023-04-02 16:23:39');   

create database Innlog;

use Innlog;

create table users (
    username varchar(40),
    password varchar(40),
	email varchar(40)
);

--Hvis du bruker en annen MariaDB enn den som blir installert med XAMPP, må du kjøre denne i MariaDB
ALTER USER root@localhost IDENTIFIED VIA mysql_native_password;
SET PASSWORD = PASSWORD('foo'); --bytt ut 'foo' med ditt passord, f.eks. 'Admin'