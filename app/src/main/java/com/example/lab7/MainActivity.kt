package com.example.lab7

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.activity.viewModels
import androidx.lifecycle.Observer
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.lab7.model.TriviaViewModel
import com.example.lab7.util.JSONData

class MainActivity : AppCompatActivity() {

    private val viewModel: TriviaViewModel by viewModels()
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        if (viewModel.triviaList.value == null){
            val loader = JSONData()
            loader.loadJSON(this.applicationContext, viewModel)
        }

        val recyclerView: RecyclerView = findViewById(R.id.recyclerView)

        recyclerView.layoutManager = LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false)

        val adapter = MyListAdapter(viewModel)

        recyclerView.adapter = adapter

        viewModel.triviaList.observe(this, Observer { adapter.update() })
    }
}