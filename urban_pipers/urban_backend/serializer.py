from rest_framework import serializers
from urban_backend.models import Category, FoodItems

class CategorySerializer(serializers.ModelSerializer):
    """
    created by: nitu 
    """

    class Meta:
        model = Category
        fields = "__all__"



class FoodItemSerializer(serializers.ModelSerializer):
    """
    created by: nitu 
    """
    category_name = CategorySerializer()
    class Meta:
        model = FoodItems
        fields = "__all__"