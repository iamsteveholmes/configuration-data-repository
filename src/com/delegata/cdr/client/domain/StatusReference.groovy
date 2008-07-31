package com.delegata.cdr.client.domain

class StatusReference{
    String id
    String name
    String description
    Set statuses

    String toString() {
        return "${name}"
    }
}