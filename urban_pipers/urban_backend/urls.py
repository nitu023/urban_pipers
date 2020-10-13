from django.urls import path
from django.conf.urls import url
from urban_backend.views import ListCategory, FilterItemsByName, FilterItemsByType, SearchItemsByName

urlpatterns = [
    url(r"^list_category_name/$", ListCategory.as_view()),
    url(r"^filter_items_name/$", FilterItemsByName.as_view()),
    url(r"^filter_items_type/$", FilterItemsByType.as_view()),
    url(r"^search_items_type/$", SearchItemsByName.as_view()),  
]