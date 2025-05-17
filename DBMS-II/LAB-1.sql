--------------------------------------------Lab-1---------------------------------------------

--------------------------------------------part-A----------------------------------------

--1. Retrieve a unique genre of songs. 
SELECT DISTINCT GENRE
FROM SONGS

--2. Find top 2 albums released before 2010. 
SELECT TOP 2 ALBUM_TITLE
FROM ALBUMS
WHERE RELEASE_YEAR < 2010

--3. Insert Data into the Songs Table. (1245, ‘Zaroor’, 2.55, ‘Feel good’, 1005) 
INSERT INTO SONGS VALUES
(1245, 'Zaroor', 2.55, 'Fell Good', 1005);

--4. Change the Genre of the song ‘Zaroor’ to ‘Happy’ 
UPDATE SONGS
SET SONG_TITLE = 'Zaroor'
WHERE SONG_TITLE = 'HAPPY'

--5. Delete an Artist ‘Ed Sheeran’ 
DELETE FROM Artists
WHERE ARTIST_NAME = 'ED SHEERAN'

--6. Add a New Column for Rating in Songs Table. [Ratings decimal(3,2)] 
ALTER TABLE SONGS
ADD Ratings decimal(3,2)

--7. Retrieve songs whose title starts with 'S'. 
SELECT SONG_TITLE FROM SONGS
WHERE Song_title LIKE 'S%'

--8. Retrieve all songs whose title contains 'Everybody'. 
SELECT SONG_TITLE FROM SONGS
WHERE Song_title LIKE '%EVERYBODY%'

--9. Display Artist Name in Uppercase.
SELECT UPPER(ARTIST_NAME)
FROM Artists

--10. Find the Square Root of the Duration of a Song ‘Good Luck’ 
SELECT SQRT(DURATION) 
FROM SONGS
WHERE Song_title='GOOD LUCK'

--11. Find Current Date. 
SELECT GETDATE() 

--12. Find the number of albums for each artist. 
SELECT ARTISTS.ARTIST_NAME,COUNT(ALBUMS.Album_id) AS NUM_OF_ALBUMS
FROM ARTISTS JOIN ALBUMS
ON Artists.Artist_id=Albums.Artist_id
GROUP BY ARTISTS.Artist_NAME

--13. Retrieve the Album_id which has more than 5 songs in it.
SELECT Album_id ,COUNT(ALBUM_ID) FROM SONGS 
GROUP BY ALBUM_ID
HAVING COUNT(ALBUM_ID) > 5

--14. Retrieve all songs from the album 'Album1'. (using Subquery) 
SELECT SONG_TITLE FROM SONGS
WHERE ALBUM_ID IN(
		SELECT ALBUM_ID FROM ALBUMS
		WHERE Album_title='ALBUM1')

--15. Retrieve all albums name from the artist ‘Aparshakti Khurana’ (using Subquery) 
SELECT ALBUM_TITLE FROM ALBUMS
WHERE ARTIST_ID IN (
		SELECT ARTIST_ID FROM ARTISTS
		WHERE ARTIST_NAME='APARSHAKTI KHURANA')

--16. Retrieve all the song titles with its album title. 
SELECT S.SONG_TITLE , A.ALBUM_ID 
FROM SONGS S JOIN ALBUMS A
ON S.ALBUM_ID=A.ALBUM_ID

--17. Find all the songs which are released in 2020. 
SELECT S.SONG_TITLE 
FROM SONGS S JOIN ALBUMS A
ON S.ALBUM_ID=A.ALBUM_ID
WHERE A.RELEASE_YEAR = 2020

--18. Create a view called ‘Fav_Songs’ from the songs table having songs with song_id 101-105.
CREATE VIEW VW_FAV_SONGS
AS 
SELECT SONG_TITLE , SONG_ID
FROM SONGS
WHERE SONG_ID BETWEEN 101 AND 105

SELECT * FROM VW_FAV_SONGS

--19. Update a song name to ‘Jannat’ of song having song_id 101 in Fav_Songs view. 
UPDATE VW_FAV_SONGS
SET SONG_TITLE='JANAT'
WHERE SONG_ID=101

--20. Find all artists who have released an album in 2020. 
SELECT ARTISTS.Artist_name 
FROM ARTISTS JOIN ALBUMS
ON ARTISTS.ARTIST_ID = ALBUMS.Artist_id
WHERE ALBUMS.Release_year = 2020

--21. Retrieve all songs by Shreya Ghoshal and order them by duration. 
SELECT S.SONG_TITLE 
FROM ALBUMS AL
JOIN ARTISTS AR
ON AL.Artist_id=AR.Artist_id
JOIN SONGS S
ON AL.ALBUM_ID=S.ALBUM_ID
WHERE AR.ARTIST_NAME='SHREYA GHOSHAL'


----------------------------------PART-B----------------------------------
--22. Retrieve all song titles by artists who have more than one album. 
SELECT S.SONG_TITLE
FROM SONGS S
JOIN ALBUMS AL ON S.ALBUM_ID = AL.ALBUM_ID
JOIN ARTISTS AR ON AL.ARTIST_ID = AR.ARTIST_ID
WHERE AL.ARTIST_ID IN (
    SELECT ARTIST_ID
    FROM ALBUMS
    GROUP BY ARTIST_ID
    HAVING COUNT(ALBUM_ID) > 1
);

--23. Retrieve all albums along with the total number of songs. 
SELECT A.ALBUM_TITLE , COUNT(S.SONG_ID)
FROM SONGS S JOIN ALBUMS A
ON S.ALBUM_ID = A.ALBUM_ID
GROUP BY A.ALBUM_TITLE

--24. Retrieve all songs and release year and sort them by release year.  
SELECT S.SONG_TITLE,AL.Release_year
FROM SONGS S JOIN ALBUMS AL 
ON S.Album_id=AL.Album_id
ORDER BY AL.Release_year

--25. Retrieve the total number of songs for each genre, showing genres that have more than 2 songs.

SELECT S.GENRE , COUNT(S.SONG_ID) AS TOTAL_SONGS
FROM SONGS S
GROUP BY S.GENRE 

SELECT S.GENRE , COUNT(S.SONG_ID) AS TOTAL_SONGS
FROM SONGS S
GROUP BY S.GENRE 
HAVING COUNT(*) > 2


--26. List all artists who have albums that contain more than 3 songs.

SELECT AR.ARTIST_NAME 
FROM ARTISTS AR 
JOIN ALBUMS AL ON AR.ARTIST_ID = AL.ARTIST_ID
JOIN SONGS S ON AL.ALBUM_ID=S.ALBUM_ID
GROUP BY AR.Artist_id,AR.Artist_name
HAVING COUNT(S.Song_id) > 3

------------------------------------PART-C----------------------------------------------

--27. Retrieve albums that have been released in the same year as 'Album4' 
SELECT ALBUM_TITLE
FROM ALBUMS
WHERE RELEASE_YEAR IN (
	SELECT RELEASE_YEAR
	FROM ALBUMS
	WHERE ALBUM_TITLE='ALBUM4'
)

--28. Find the longest song in each genre
SELECT SONG_TITLE,GENRE
FROM SONGS
WHERE DURATION IN (
	SELECT MAX(DURATION)
	FROM SONGS
	GROUP BY GENRE
)

--29. Retrieve the titles of songs released in albums that contain the word 'Album' in the title. 
SELECT SONG_TITLE 
FROM SONGS S JOIN ALBUMS AL
ON S.ALBUM_ID = AL.ALBUM_ID
WHERE S.ALBUM_ID IN(
	SELECT AL.ALBUM_ID
	FROM ALBUMS
	WHERE ALBUM_TITLE LIKE '%ALBUM%'
)

--30. Retrieve the total duration of songs by each artist where total duration exceeds 15 minutes. 
SELECT SUM(S.DURATION) 
FROM SONGS S 
JOIN ALBUMS AL ON S.ALBUM_ID=AL.ALBUM_ID
JOIN ARTISTS AR ON AL.ARTIST_ID=AR.ARTIST_ID
GROUP BY AR.Artist_name
HAVING SUM(S.DURATION) > 15
