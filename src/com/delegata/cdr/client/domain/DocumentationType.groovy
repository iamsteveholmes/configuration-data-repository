package com.delegata.cdr.client.domain

class DocumentationType implements java.io.Serializable{
    String id
    String description
    String type = 'Documentation'
    String category = "documentation"

    Set documents

    String toString(){
        return "${description}"
    }
}