Class IRISHealth.Patient
{
    ClassMethod AddPatient(id, name, insurance)
    {
        SET ^Patient(id, "Name") = name
        SET ^Patient(id, "Insurance") = insurance
    }

    /// Description
    ClassMethod GetPatientName(id)
    {
        QUIT ^Patient(id, "Name")
    }

    ClassMethod GetPatientInsurance(id)
    {
        QUIT ^Patient(id, "Insurance")
    }
    ClassMethod ListPatients()
    {
        SET id = ""
        FOR  {
            SET id = $ORDER(^Patient(id))
            QUIT:id=""
            WRITE "Patient ID: ", id, ", Name: ", ^Patient(id,"Name"), ", Insurance: ", ^Patient(id,"Insurance"), !
        }
    }
}
