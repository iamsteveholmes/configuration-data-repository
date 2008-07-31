package com.delegata.cdr.client.domain

class HardwareType implements java.io.Serializable{
    String id
    String description
    String type = 'Hardware'
    String category = "hardware"

    String toString(){
        return "${description}"
    }
}