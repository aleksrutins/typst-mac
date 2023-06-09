mod world;

use std::{ffi::CStr, os::raw::c_char, path::{PathBuf, Path}, fs};

use world::SystemWorld;
use typst::World;

#[repr(C)]
pub struct PtrVec {
    pub data: *const u8,
    pub size: usize,
}

impl PtrVec {
    pub fn from(vec: Vec<u8>) -> Self {
        Self {
            data: vec.as_ptr(),
            size: vec.len()
        }
    }
}

#[no_mangle]
pub unsafe extern "C" fn compile(filename: *const c_char) -> PtrVec {
    let filename_s = CStr::from_ptr(filename);
    let mut world = SystemWorld::new(PathBuf::new());
    world.reset();
    world.main = world.resolve(Path::new(filename_s.to_str().unwrap())).unwrap();

    let document = typst::compile(&world).unwrap();
    let buffer = typst::export::pdf(&document);
    PtrVec::from(buffer)
}

#[no_mangle]
pub unsafe extern "C" fn compile_str(code: *const c_char) -> PtrVec {
    let data_s = CStr::from_ptr(code);
    fs::write("typst-live.typ", data_s.to_str().unwrap()).unwrap();
    return compile("typst-live.typ".as_ptr() as *const i8);
}
