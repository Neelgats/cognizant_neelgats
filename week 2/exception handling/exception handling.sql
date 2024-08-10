BEGIN
    SafeTransferFunds(1, 2, 500);
    UpdateSalary(101, 10);
    AddNewCustomer(5, 'Alice Cooper', TO_DATE('1992-04-25', 'YYYY-MM-DD'), 1500);
END;
