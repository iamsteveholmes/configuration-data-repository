package com.delegata.cdr.client.domain

class TestResultType{
    String id
    String description
    Set results
    String type = 'Test Result'
    String category = "testResult"

    String toString(){
        return "${description}"
    }
}