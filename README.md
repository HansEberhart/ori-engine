# ori-engine
A small engine written in rust + Vulkan.

## Target


### Overview

The target of this engine is, to have a safe and fast, but still visually
beautiful engine which works on most modern systems.
The speed should be supplied by the parallel nature of the engine.
The engine will have at least 4 different loops which will manage different
aspects of the engine and its systems.
 1. rendering loop
 2. asset management
 3. physics
 4. input

In addition the system will spawn threads for workloads like config-loading
or mesh importing.


### Safety

The engine should be safe because of two major points.
 1. it uses Rust which is "safe" by design
 2. it uses the vulkano for interacting with vulkan, which will be safe as well
    in the future

### Graphical target

The graphical target is defined by these keyn points:

 - PBR shading
 - normal mapping
 - parallax occlusion mapping
 - HDR rendering
 - dynamic lighting (point, spot and directional lights for now)
 - bloom
 - DOF
 - translucency
 - masked materials

This will be accomplished by static Shaders + different material definition for
now. In later development this system could be changed to a UE4 type
material system with different Shader components.

### Asset management

All of the assets will be grouped in different managers as `Arc<Mutex<T>>`
components, for instance all meshes.
There is a scene manager who saves different hierarchical "scenes" of those
assets. For example a light which is parent to a mesh and a camera which is
saved as a scene "wall_lamp".
This has the advantage of being able to modify one of the meshes in the mesh
manager and simultaneously changing all of its references as well.

This scene trees are 1-n trees for now. So every parent can have n childs.
The Node types are hard coded for now but will be changed to a Arc<NodeType> in
the future. If you have a better system, please add a issue to the repository.
I took inspiration from the Godot-engine for the scene system.


## Documentation
There is currently no documentation hosted, but you can do
```
cargo doc --open
```
to build the documentation yourself. The index.html will be saved to
```
target/doc/ori_engine/index.html
```

## Building

Pull the git repository via
```
git clone https://github.com/SiebenCorgie/ori-engine.git
```
then do
```
cargo build
```
to compile or
```
cargo run --examples simple
```
to run an example application.

*Note: You'll need vulkan installed*

## License

You can decide if you want to use MIT or Apache License, Version 2.0.
