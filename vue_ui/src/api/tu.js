import request from '@/utils/request'
export function uploadPicture(data) {
  return request({ //上传图片
    url: 'tu/upload',
    method: 'post',
    data
  })
}

export function addTu(data) {
  return request({ //添加图片路径
    url: 'tu/addTu',
    method: 'post',
    data
  })
}
