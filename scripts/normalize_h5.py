import h5py
import numpy as np
import sys

def normalize_ri(h5_path):
    with h5py.File(h5_path, "r+") as f:
        # Find dataset path dynamically
        def find_sphere_dataset(g):
            for key, item in g.items():
                if isinstance(item, h5py.Dataset) and key == "sphere_dataset":
                    return item.name
                if isinstance(item, h5py.Group):
                    result = find_sphere_dataset(item)
                    if result:
                        return result
            return None

        ds_path = find_sphere_dataset(f)
        if not ds_path:
            raise KeyError("Could not find 'sphere_dataset' in the file.")
        print(f"Found sphere dataset at: {ds_path}")

        data = f[ds_path][:]
        if data.shape[1] < 4:
            raise ValueError("Expected sphere_dataset with 4 columns [x, y, z, ri].")

        ri = data[:, 3]
        ri_min, ri_max = ri.min(), ri.max()
        print(f"Original RI range: [{ri_min:.6f}, {ri_max:.6f}]")

        if np.isclose(ri_max, ri_min):
            print("All RI values are identical — normalization skipped.")
            return

        # Normalize RI to 0–100
        ri_norm = (ri - ri_min) / (ri_max - ri_min) * 100.0
        data[:, 3] = ri_norm

        # Write back
        f[ds_path][:] = data
        print(f"Normalized RI range: [{data[:,3].min():.2f}, {data[:,3].max():.2f}]")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python normalize_h5.py <path_to_h5>")
        sys.exit(1)
    normalize_ri(sys.argv[1])
