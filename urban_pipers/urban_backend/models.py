from django.db import models

# Create your models here.
class Category(models.Model):
    """
        created by:
    """
    category_name = models.CharField(max_length=222, blank=True, null=True, unique=True)
    is_delete = models.BooleanField(default=False)

    class Meta:
        ordering = ["-pk"]



class FoodItems(models.Model):
    """
        created by:
    """
    category_name = models.ForeignKey(Category, on_delete=models.CASCADE, null=True)
    food_name = models.CharField(max_length=222, blank=True, null=True, unique=True)
    discription = models.CharField(max_length=222, blank=True, null=True, unique=True)
    is_veg = models.BooleanField(default=False)
    price =  models.FloatField(null=True, blank=True)
    is_available = models.BooleanField(default=True)
    is_delivered = models.BooleanField(default=False)
    delivery_partener = models.CharField(max_length=22, null=True)
    item_rating = models.CharField(max_length=22, null=True)


    class Meta:
        ordering = ["-pk"]