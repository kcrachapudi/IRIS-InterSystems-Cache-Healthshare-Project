Class IRISHealth.PatientAPI Extends %CSP.REST
{

/*
    This tells IRIS:
    "This class is a REST API endpoint controller"
*/
Parameter HandleCorsRequest = 1;

/*
    URL routing table.
    This maps HTTP requests → class methods.
*/
XData UrlMap
{
<Routes>

    <!-- GET /irishealth/patients -->
    <Route Url="/patients" Method="GET" Call="ListPatients"/>

    <!-- POST /irishealth/patient -->
    <Route Url="/patient" Method="POST" Call="AddPatient"/>

</Routes>
}

//////////////////////////////////////////////////////////////////////////////////////
// GET handler
//////////////////////////////////////////////////////////////////////////////////////
ClassMethod ListPatients() As %Status
{
    /*
        This reads all data stored in global:
        ^Patient(id, ...)
    */

    SET id = ""

    WRITE "=== Patient List ===", !

    FOR  {
        SET id = $ORDER(^Patient(id))
        QUIT:id=""

        WRITE "ID: ", id, !
        WRITE "Name: ", $GET(^Patient(id,"Name")), !
        WRITE "Insurance: ", $GET(^Patient(id,"Insurance")), !
        WRITE "----------------------", !
    }

    QUIT $$$OK
}

//////////////////////////////////////////////////////////////////////////////////////
// POST handler (simple test version)
//////////////////////////////////////////////////////////////////////////////////////
ClassMethod AddPatient() As %Status
{
    /*
        For now we are NOT parsing JSON yet.
        We just insert a sample record.
    */

    SET id = 1
    SET name = "Test Patient"
    SET insurance = "INS-001"

    SET ^Patient(id,"Name") = name
    SET ^Patient(id,"Insurance") = insurance

    WRITE "Patient added successfully", !

    QUIT $$$OK
}

}