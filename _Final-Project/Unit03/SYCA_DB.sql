/* Create the database if it doesn't exist*/
create database if not exists SYCA_DB;

DROP TABLE if exists assistant;
DROP TABLE if exists counselor;
DROP TABLE if exists camper;
DROP TABLE if exists cabin;
DROP TABLE if exists camp_leader;
DROP TABLE if exists camp;
DROP TABLE if exists guest_speaker;

Create table guest_speaker (
	Guest_ID		int			NOT NULL UNIQUE,
	Guest_fname		varchar(35),		
	Guest_lname		varchar(35),
	Guest_DOB		date			NOT NULL default(1971-01-01),
	Guest_wage		Numeric(7,2)	NOT NULL default(0000.00),
	primary key (Guest_ID)
);

Create table camp (
	Camp_ID			int 			Primary key,
	Camp_name			varchar(35)		default('camp'),
	Camp_address			varchar(36)		default('N/A'),
	Camp_year_built		year			default(0000),
	Camp_years_service		numeric(3)		default(000),
	Camp_weeks_num		numeric(2)		default(00),
	Guest_ID			int,
	Foreign key (Guest_ID) references guest_speaker (Guest_ID)
);

Create table camp_leader (
	Cmpldr_ID		int 			Primary key,
	Cmpldr_fname	varchar(35),
	Cmpldr_lname		varchar(35),
	Cmpldr_DOB		date			NOT NULL default(1971-01-01),
	Cmpldr_hiredate	date			NOT NULL default(1986-01-01),
	Cmpldr_wage		Numeric(7,2)		NOT NULL default(0000.00),
	Camp_ID		int,
	Foreign key (Camp_ID) references camp (Camp_ID)
);

Create table cabin (
	Cabin_ID			int			primary key,
	Cabin_slots_num		smallint		NOT NULL default(5),
	Cabin_year_built		year			NOT NULL default(2000),
	Cabin_years_service		numeric(3)		default(000),
	Cabin_stories_num		smallint,
	Cabin_jr_or_sr_type		char(2),
	Camp_ID			int,
	Foreign key (Camp_ID) references camp (Camp_ID)
);

Create table camper (
	Camper_register_num		int			primary key,
	Camper_fname			varchar(35)		NOT NULL,
	Camper_lname			varchar(35)		NOT NULL,
	Camper_DOB				date			NOT NULL,
	Camper_1st_year_date		date,
	Camper_address			varchar(36),
	Cabin_ID				int,
	Foreign key (Cabin_ID) references cabin (Cabin_ID)
);

Create table counselor (
	CNS_ID		int			primary key,
	CNS_fname		varchar(35),
	CNS_lname		varchar(35),
	CNS_DOB		date,
	CNS_returning		char(1),
	CNS_wage		numeric(7,2)		default(0000.00),
	Cabin_ID		int,
	Foreign key (Cabin_ID) references cabin (Cabin_ID)
);

Create table assistant (
	ASSIST_ID		int			primary key,
	ASSIST_fname		varchar(35),
	ASSIST_lname		varchar(35),
	ASSIST_DOB		date,
	ASSIST_returning	char(1),
	ASSIST_wage		numeric(7,2)		default(0000.00),
	CNS_ID		int,
	Foreign key (CNS_ID) references counselor (CNS_ID)
);
