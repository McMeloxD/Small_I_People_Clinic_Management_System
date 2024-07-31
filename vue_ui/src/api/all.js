import request from '@/utils/request'
export function getList(params) {
  return request({ //查全部，单位编码模糊查询，单位名字模糊查询
    url: '/md/nested/findAll',
    method: 'get',
    params
  })
}
export function delById(params) {
  return request({ //删
    url: '/md/nested/delById',
    method: 'get',
    params
  })
}

export function update(charge) {
  return request({ //改
    url: '/md/nested/update',
    method: 'post',
    data:charge
  })
}

export function delByIds(ids) {
  return request({ //批量删除
    url: '/md/nested/dels',
    method: 'get',
    params:{ids}
  })
}
export function getAdd(data) {
  return request({ //添加
    url: '/md/nested/add',
    method: 'post',
    data
  })
}

