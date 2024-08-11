use std::env;
use sysinfo::System;

fn cpu_usage(system: &mut System) -> f64 {
    std::thread::sleep(sysinfo::MINIMUM_CPU_UPDATE_INTERVAL);
    system.refresh_cpu_all();
    system.global_cpu_usage() as f64
}

fn memory_usage(system: &mut System) -> f64 {
    system.refresh_memory();
    let total = system.total_memory();
    let used = system.used_memory();
    used as f64 / total as f64 * 100.0
}

fn main() {
    let args: Vec<_> = env::args().collect();
    let mut system = System::new_all();

    let cpu_usage = cpu_usage(&mut system);
    let memory_usage = memory_usage(&mut system);

    if args[1] == "cpu" {
        println!("{}%", cpu_usage.floor());
    } else if args[1] == "mem" {
        println!("{}%", memory_usage.floor());
    }
}
