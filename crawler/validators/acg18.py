"""
We use this validator to filter ip that can access mobile zhihu website.
"""
from config.settings import (
    TEMP_ACG18_QUEUE, VALIDATED_ACG18_QUEUE,
    TTL_ACG18_QUEUE, SPEED_ACG18_QUEUE)
from ..redis_spiders import ValidatorRedisSpider
from .base import BaseValidator


class ZhiHuValidator(BaseValidator, ValidatorRedisSpider):
    """This validator check the liveness of zhihu proxy resources"""
    name = 'acg18'
    urls = [
        'https://acg18.us/'
    ]
    task_queue = TEMP_ACG18_QUEUE
    score_queue = VALIDATED_ACG18_QUEUE
    ttl_queue = TTL_ACG18_QUEUE
    speed_queue = SPEED_ACG18_QUEUE
    success_key = '爬虫'

