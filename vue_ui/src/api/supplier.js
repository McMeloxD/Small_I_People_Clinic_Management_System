import request from '@/utils/request'
export function getsupplier(params) {
  return request({ //查全部，单位编码模糊查询，单位名字模糊查询
    url: 'supplier/findAll',
    method: 'get',
    params
  })
}
export function delById(params) {
  return request({ //删
    url: 'supplier/delById',
    method: 'get',
    params
  })
}
export function update(supplier) {
  return request({ //改
    url: 'supplier/update',
    method: 'post',
    data:supplier
  })
}
export function delByIds(ids) {
  return request({ //批量删除
    url: 'supplier/dels',
    method: 'get',
    params:{ids}
  })
}
export function getAdd(data) {
  return request({ //添加
    url: 'supplier/add',
    method: 'post',
    data
  })
}
export function uploadPicture(data) {
  return request({ //上传图片
    url: 'supplier/upload',
    method: 'post',
    data
  })
}


