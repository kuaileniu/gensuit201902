# CREATE TABLE t_she_jiao ( id INT ( 11 ) AUTO_INCREMENT PRIMARY KEY, mycontent JSON ) ENGINE INNODB;
TRUNCATE t_she_jiao;
INSERT INTO t_she_jiao ( id, mycontent )
VALUES
	( 8, '{  
	"programmers": [{  
	"firstName": "Brett",  
	"lastName": "McLaughlin",  
	"email": "aaaa"  
	}, {  
	"firstName": "Jason",  
	"lastName": "Hunter",  
	"email": "bbbb"  
	}, {  
	"firstName": "Elliotte",  
	"lastName": "Harold",  
	"email": "cccc"  
	}],  
	"authors": [{  
	"firstName": "Isaac",  
	"lastName": "Asimov",  
	"genre": "sciencefiction"  
	}, {  
	"firstName": "Tad",  
	"lastName": "Williams",  
	"genre": "fantasy"  
	}, {  
	"firstName": "Frank",  
	"lastName": "Peretti",  
	"genre": "christianfiction"  
	}],  
	"musicians": [{  
	"firstName": "Eric",  
	"lastName": "Clapton",  
	"instrument": "guitar"  
	}, {  
	"firstName": "Sergei",  
	"lastName": "Rachmaninoff",  
	"instrument": "piano"  
	}]  
	}' );
SELECT
	id,
	json_keys ( mycontent ) AS "keys" 
FROM
	t_she_jiao;
SELECT
	json_extract ( AUTHORS, '$.lastName[0]' ) AS 'name',
AUTHORS 
FROM
	(
SELECT
	id,
	json_extract ( mycontent, '$.authors[0][0]' ) AS "authors" 
FROM
	t_she_jiao UNION ALL
SELECT
	id,
	json_extract ( mycontent, '$.authors[1][0]' ) AS "authors" 
FROM
	t_she_jiao UNION ALL
SELECT
	id,
	json_extract ( mycontent, '$.authors[2][0]' ) AS "authors" 
FROM
	t_she_jiao 
	) AS T1 
ORDER BY
	NAME DESC;
SELECT
	json_extract ( AUTHORS, '$.firstName[0]' ) AS "firstname",
	json_extract ( AUTHORS, '$.lastName[0]' ) AS "lastname",
	json_extract ( AUTHORS, '$.genre[0]' ) AS "genre" 
FROM
	( SELECT id, json_extract ( mycontent, '$.authors[0]' ) AS "authors" FROM t_she_jiao ) AS T;
SELECT
	json_contains_path ( mycontent, 'all', '$.authors' ) AS authors_exists 
FROM
	t_she_jiao;