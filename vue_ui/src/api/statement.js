import request from '@/utils/request'

export function getSex4ECharts() {
  return request({
    url: '/sys/user/sex',
    method: 'get',

  })
}

export function getBingkeECharts() {
  return request({
    url: '/guahao/getBingkeECharts',
    method: 'get',
  })
}

export function getDrug4ECharts() {
  return request({
    url: '/sys/user/drug',
    method: 'get',

  })
}

export function uploadTu(data) {
  return request({ //添加图片路径
    url: '/details/uploadTu',
    method: 'post',
    data
  })
}

export function addPicture(data) {
  return request({
    url: '/details/addPicture',
    method: 'post',
    data
  })
}
