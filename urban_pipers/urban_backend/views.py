from django.shortcuts import render
from rest_framework.generics import (CreateAPIView, ListAPIView, RetrieveUpdateDestroyAPIView)
from rest_framework.response import Response
import traceback
from rest_framework.views import APIView
from urban_backend.serializer import CategorySerializer, FoodItemSerializer
from urban_backend.models import Category, FoodItems


# Create your views here.

class ListCategory(ListAPIView):
    serializer_class = CategorySerializer

    def get_queryset(self):
        queryset = Category.objects.filter(
            is_delete=False
        )
        return queryset


class FilterItemsByName(ListAPIView):

    serializer_class = FoodItemSerializer

    def get_queryset(self):
        category_name = self.request.query_params["category_name"]
        print(category_name)
        queryset = FoodItems.objects.filter(category_name_id=category_name)
        return queryset

class SearchItemsByName(ListAPIView):
    serializer_class = FoodItemSerializer
    
    def get_queryset(self):
        food_name = self.request.query_params["food_name"]
        category_name = self.request.query_params["category_name"]
        queryset = FoodItems.objects.filter(category_name_id=category_name, food_name__icontains = food_name)        
        return queryset


class FilterItemsByType(ListAPIView):
    serializer_class = FoodItemSerializer

    def get_queryset(self):
        is_veg = self.request.query_params["is_veg"]
        category_name = self.request.query_params["category_name"]
        print(is_veg)
        if is_veg == "Veg":
            queryset = FoodItems.objects.filter(category_name_id=category_name,is_veg=True)
        else:
            queryset = FoodItems.objects.filter(category_name_id=category_name)
        return queryset