# Generated by Django 4.2.3 on 2024-01-18 06:53

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('projects', '0002_alter_pledge_supporter_alter_project_owner'),
    ]

    operations = [
        migrations.AlterField(
            model_name='pledge',
            name='supporter',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='supported_pledges', to=settings.AUTH_USER_MODEL),
        ),
    ]
