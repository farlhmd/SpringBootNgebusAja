## Final Project Java Spring Boot
Nama &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;: Muhammad Farhan Ilhamdi\
Kode peserta : JVSB001ONL014 \
Github&ensp;&ensp;&ensp;&ensp;&ensp;&ensp; : [Spring Boot Ngebus Aja!](https://github.com/farlhmd/SpringBootNgebusAja)




## Demo
[Deployed App]()


## Api endpoint

1. agency-controller
2. auth-controller
3. bus-controller
4. stop-controller
5. trip-controller
6. user-controller 



## Generate schema database (HIBERNATE) 
1. untuk pembuatan schema pertama kali, set `spring.jpa.hibernate.ddl-auto=update`
2. setelah selesai, ubah `spring.jpa.hibernate.ddl-auto=validate`, untuk melakukan validasi spring JPA dengan database schema


<br>


## Database Migration (FLyWay) (PostgreSQL)
1. export database schema dari database 
2. `pg_dump --host=<host> --port=<port> --username=<username> --password --dbname=<database> > V1.0__ddl.sql`
3. masukan file `V1.0__ddl.sql` kedalam `src/main/resources/db/migration`




## Dependencies
`JAVA 8` `MySQL`   

`Maven` `Spring Tools 4` `Postman` `Swagger`

`IDE (Tested in VSCode)`
