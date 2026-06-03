Class IRISHealth.Run
{
    ClassMethod Main()
    {
        WRITE "=== IRIS Health Project Start ===", !

        DO ##class(IRISHealth.Patient).AddPatient(1,"John Doe","INS123")
        DO ##class(IRISHealth.Patient).AddPatient(2,"Alice","INS999")

        WRITE "--- Listing Patients ---", !
        DO ##class(IRISHealth.Patient).ListPatients()

        WRITE "=== Done ===", !
    }
}