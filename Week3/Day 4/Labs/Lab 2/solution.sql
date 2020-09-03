SELECT * FROM Authors
SELECT * FROM titleauthor
SELECT * FROM titles
SELECT * FROM publishers
SELECT * FROM sales

----
--Challenge 1

CREATE TEMP TABLE pub_title AS (
SELECT D.pub_id, D.pub_name, C.title, C.title_id
FROM publishers as D
INNER JOIN
titles as C
ON D.pub_id = C.pub_id);

---Putting together with Author
CREATE TEMP TABLE pubtitle_author AS (
SELECT B.au_id, pub_title.title_id, pub_title.title, pub_title.pub_name
FROM titleauthor AS B
	INNER JOIN
	pub_title
	ON
		B.title_id = pub_title.title_id
);
---- Final Query
CREATE TEMP TABLE Challenge1 AS (
SELECT 
	A.au_id as author_id, A.au_lname as last_name, A.au_fname as first_name,
pubtitle_author.title, pubtitle_author.pub_name, pubtitle_author.title_id
FROM 
	authors as A
INNER JOIN
	pubtitle_author
ON
	A.au_id = pubtitle_author.au_id
);

---Challenge 2
SELECT 
	author_id, last_name, pub_name, Count(title) as count_titles
FROM
	Challenge1
GROUP BY
	author_id, last_name, pub_name
ORDER BY
	count_titles DESC;

--CHALLENGE 3
SELECT 
	CH.author_id, CH.last_name, CH.first_name, Sum(sales.qty) as total
FROM 
	Challenge1 as CH
INNER JOIN
	sales
ON
	CH.title_id = sales.title_id
GROUP BY 
	CH.author_id, CH.last_name, CH.first_name
ORDER BY
	total DESC
LIMIT 3
;

--CHALLENGE 4
authors/titleauthors/sales

SELECT 
	A.au_id, A.au_lname, A.au_fname, COALESCE(SUM(C.qty),0) as total
FROM 
	authors as A
LEFT JOIN
	titleauthor as B
ON
	A.au_id = B.au_id
LEFT JOIN
	sales as C
ON
	B.title_id = C.title_id
GROUP BY
	A.au_id, A.au_lname, A.au_fname
ORDER BY
	total DESC
;
	
