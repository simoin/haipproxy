"""
We use this validator to filter ip that can access konachan website.
"""
from config.settings import ( TEMP_KONACHAN_QUEUE, VALIDATED_KONACHAN_QUEUE, TTL_KONACHAN_QUEUE, SPEED_KONACHAN_QUEUE)
from ..redis_spiders import ValidatorRedisSpider
from .base import BaseValidator


class KonachanValidator(BaseValidator, ValidatorRedisSpider):
    """This validator check the liveness of konachan proxy resources"""
    name = 'konachan'
    urls = [
        'https://konachan.com/post'
    ]
    task_queue = TEMP_KONACHAN_QUEUE
    score_queue = VALIDATED_KONACHAN_QUEUE
    ttl_queue = TTL_KONACHAN_QUEUE
    speed_queue = SPEED_KONACHAN_QUEUE
    success_key = 'Search'

