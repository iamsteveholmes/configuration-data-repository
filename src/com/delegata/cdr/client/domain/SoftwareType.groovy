package com.delegata.cdr.client.domain

class SoftwareType{
    String id
    String description
    Set softwares
    String type = 'Software'
    String category = "software"

    String toString(){
        return "${description}"
    }
}