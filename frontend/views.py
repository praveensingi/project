from django.shortcuts import render

def home(request):
    return render(request, 'home.html')
def careers(request):
    return render(request, 'careers.html')