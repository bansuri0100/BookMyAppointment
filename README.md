# BookMyAppointment
[Result Screenshots](https://github.com/bansuri0100/BookMyAppointment/blob/master/Screenshots.pptx)

INTRODUCTION

In today’s time every clinic or hospital faces the problem of managing appointments
with doctors. Our project ‘BookMyAppointment’ is a small scale solution that aims at
digitizing the process of booking appointments with doctors at small clinics or hospitals
which is easy and fast, thereby doing away with the legacy system of booking
appointments using pen and paper which is cumbersome and not easy to maintain in
the long run.
BookMyAppointment is a web application built using Java. Java provides support for
web application through Servlets and JSPs. This project is a collection of Java Server
Pages along with support of MySQL database for data persistence.


DESIGN PHASE

This project facilitates the hospital or clinic lobby staff who manage appointments to
log into their respective accounts after entering required credentials. Post login they will
be provided with the list of doctors working in the hospital and another list of the
patients who have visited them in the past.
The staff can enter the patient credentials like phone number or patient id to check if
his records are already present the database. If not they can register the patient details
with them. If the patient is already registered with them then they can update the patient
records such as the age or their problem type if necessary. Upon updating, a list of
doctors who are specialized in their respective fields is displayed along with their
schedule for each week. The staff can assess this information and make appointments
with the available doctor and convey the same to the patient.
To achieve the above mentioned work flow, there are a total of eleven jsp files namely:

1. Landing.jsp – The landing page for the application.
2. Login.jsp – This page provides the necessary UI for the staff to enter their
credentials to log into the portal.
3. LoginProcess.jsp – This page handles the database logic which involves querying
the specified table to see if the hospital staff is registered.
4. AfterLogin.jsp – This page displays the list of doctors working in the hospital
and the list of patients registered with the hospital along with the UI to enter the
patient id or phone number to check if they have previously registered.
5. Check.jsp – This page queries the database to check if the patient records is
present in the database. If not found, then it will redirect back to AfterLogin.jsp
with an appropriate message. If present, then it will direct to the
UpdatePatient.jsp page.
6. AddPatient.jsp – This page has the necessary UI to handle the registration of a
new patient.
7. AddPatientProcess – This page has code that handles the database part of the
registration process.
8. UpdatePatient.jsp – This page provides the required UI to enter the details that
has to be updated the database. Post updation the staff member is directed to
the BookPatient.jsp page.
9. BookAppointment.jsp – In this page, based on the type of problem the patient
has entered, a list of available doctors along with their schedule is displayed based
on which the hospital staff has to book appointments.
10. ShowAppointment.jsp – This page displays the details of the appointment
booked along with the list of all the other appointments for that day.
11.Logout.jsp – End the session of the staff member and is diected back to the login
page.

The database tables required for this process is as follows:

1. Staff Table – To store the details of the hospital staff who handle the
appointment process with fields id, email, name, password.
2. Doctors Table - To store the details of the doctors working in the hospital with
fields id, name, specialization, days available, timings.
3. Patients Table - To store the details of the patient having fields id, fname, lname,
problem, phone number, aadhar , address etc.
4. Appointments Table – To store the appointment details with fields doctor name,
patient name, date, timings.
