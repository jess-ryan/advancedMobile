package com.example.lab7.model

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel

class TriviaViewModel: ViewModel() {
    val triviaList = MutableLiveData<ArrayList<Trivia>>()
    fun updateList(newList: ArrayList<Trivia>){
        triviaList.value = newList
    }
}