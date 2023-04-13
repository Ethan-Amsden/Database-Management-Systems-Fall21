/* The first “SELECT” query is intended to give information about which counselor and campers cabin “1” has. */
select		
	Cabin_ID, CNS_ID, CNS_fname, CNS_lname, Camper_register_num, Camper_fname, Camper_lname
from		
	counselor join cabin using (Cabin_ID) join camper using (Cabin_ID)
where		
	Cabin_ID  =1;

/* The second “SELECT” is intended to give information about who is the guest speaker and camp leader(s) at the camp whose ID is two. */
select		
	Cmpldr_fname, Cmpldr_lname, Guest_fname, Guest_lname, Camp_name
from		
	camp_leader join camp using (Camp_ID) join guest_speaker using (Guest_ID)
where		
	Camp_ID = 2;

/* The third “SELECT” query is intended to give information about which counselors are getting paid between $2000 and $2500; who their camp leader(s) is; and which camp they work at. I added in an order by to make it look clean when the result comes out. */
select		
	Camp_name, Cmpldr_fname, Cmpldr_lname, Cabin_ID, CNS_fname, CNS_lname, CNS_wage
from		
	camp_leader join camp using (Camp_ID) join cabin using (Camp_ID) join counselor using (Cabin_ID)
where		
	CNS_wage between 2000 and 2500
order by	
	CNS_wage desc;



