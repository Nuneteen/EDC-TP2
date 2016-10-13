CREATE PROCEDURE salesProc1
	@usename NvarChar(50)
AS
		SELECT titles.title, sales.ord_num, sales.stor_id, sales.ord_date, sales.qty, sales.payterms 
		FROM authors JOIN titleauthor ON authors.au_id = titleauthor.au_id JOIN sales ON titleauthor.title_id = sales.title_id JOIN titles ON titleauthor.title_id = titles.title_id 
		WHERE @usename = authors.au_fname + ' ' + authors.au_lname
