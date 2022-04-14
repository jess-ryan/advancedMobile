package com.example.lab7.util

import android.content.Context
import android.util.Log
import com.android.volley.Request
import com.android.volley.toolbox.StringRequest
import com.android.volley.toolbox.Volley
import com.example.lab7.model.Trivia
import com.example.lab7.model.TriviaViewModel

import org.json.JSONException
import org.json.JSONObject

class JSONData {
    fun loadJSON(context: Context, triviaViewModel: TriviaViewModel){
        var url = "https://opentdb.com/api.php?amount=10"

        val queue = Volley.newRequestQueue(context)
        val request = StringRequest(Request.Method.GET, url,{ response-> parseJSON(response, triviaViewModel)},{ Log.e("Response", error("Request Failed"))})

        queue.add(request)
    }

    fun parseJSON(response: String, triviaViewModel: TriviaViewModel){
        val dataList = ArrayList<Trivia>()
        try{
            val jsonObject = JSONObject(response)

            val resultsArray = jsonObject.getJSONArray("results")

            for(i in 0 until resultsArray.length()){
                val triviaObject = resultsArray.getJSONObject(i)

                val question = triviaObject.getString("question")
                val answer = triviaObject.getString("correct_answer")

                val newTrivia = Trivia(question, answer)
                dataList.add(newTrivia)
            }
        } catch (e: JSONException){
            e.printStackTrace()
        }
        triviaViewModel.updateList(dataList)
    }
}