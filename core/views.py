from django.http import JsonResponse
from .models import Check


def health_check(request):
    objs = Check.objects.all().values("id", "name")
    return JsonResponse({
        "status": "ok",
        "records": list(objs)
    })
