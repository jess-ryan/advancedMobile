package com.example.lab7

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.lab7.model.TriviaViewModel
import java.text.FieldPosition

class MyListAdapter(private val triviaViewModel: TriviaViewModel): RecyclerView.Adapter<MyListAdapter.ViewHolder>() {

    class ViewHolder(view: View): RecyclerView.ViewHolder(view){

        val questionTextView: TextView = view.findViewById(R.id.triviaText)
        val answerTextView: TextView = view.findViewById(R.id.triviaTextAnswer)

    }

    private var myTriviaList = triviaViewModel.triviaList.value

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val layoutInflater = LayoutInflater.from(parent.context)
        val itemViewHolder = layoutInflater.inflate(R.layout.card_list_item, parent, false)
        return ViewHolder(itemViewHolder)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int){
        val trivia = myTriviaList?.get(position)

        holder.questionTextView.text = trivia?.question?:""
        holder.answerTextView.text = trivia?.answer?:""
    }

    override fun getItemCount(): Int {
        if(myTriviaList != null){
            return myTriviaList!!.size
        } else return 0
    }

    fun update(){
        myTriviaList = triviaViewModel.triviaList.value
        notifyDataSetChanged()
    }
}

