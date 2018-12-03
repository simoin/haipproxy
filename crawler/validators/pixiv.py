"""
We use this validator to filter ip that can access pixiv website.
"""
from config.settings import (TEMP_PIXIV_QUEUE, VALIDATED_PIXIV_QUEUE, TTL_PIXIV_QUEUE, SPEED_PIXIV_QUEUE)
from ..redis_spiders import ValidatorRedisSpider
from .base import BaseValidator


class PixivValidator(BaseValidator, ValidatorRedisSpider):
    """This validator check the liveness of pixiv proxy resources"""
    name = 'pixiv'
    urls = [
        'https://www.pixiv.net/ranking.php?mode=daily'
    ]
    task_queue = TEMP_PIXIV_QUEUE
    score_queue = VALIDATED_PIXIV_QUEUE
    ttl_queue = TTL_PIXIV_QUEUE
    speed_queue = SPEED_PIXIV_QUEUE
    success_key = 'R-18'

