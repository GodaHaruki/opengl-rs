extern crate gl_generator;

use gl_generator::{Api, Fallbacks, Profile, Registry};
use std::env;
use std::fs::File;
use std::path::Path;

fn main() {
    let dest = env::var("OUT_DIR").unwrap();
    let mut file_gl = File::create(&Path::new(&dest).join("gl_bindings.rs")).unwrap();
    let gl_extensions = [
        // "GL_KHR_debug",
    ];
    let gl_reg = Registry::new(
        Api::Gl,
        (4, 5), // Open GL の対象バージョン
        Profile::Compatibility,
        Fallbacks::All,
        gl_extensions,
    );

    if env::var("CARGO_FEATURE_DEBUG").is_ok() {
        gl_reg
            .write_bindings(gl_generator::DebugStructGenerator, &mut file_gl)
            .unwrap();
    } else {
        gl_reg
            .write_bindings(gl_generator::StructGenerator, &mut file_gl)
            .unwrap();
    }
}
