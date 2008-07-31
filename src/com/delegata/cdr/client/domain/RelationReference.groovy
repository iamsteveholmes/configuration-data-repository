package com.delegata.cdr.client.domain

class RelationReference{
    String id
    String name
    String description
    Set relations

    String toString() {
        return "${name}"
    }
}