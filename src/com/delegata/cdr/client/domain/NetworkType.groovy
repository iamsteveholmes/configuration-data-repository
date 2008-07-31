package com.delegata.cdr.client.domain

class NetworkType{
    String id
    String description
    String type = 'Network'
    String category = "network"
    Set networks

    String toString(){
        return "${description}"
    }
}