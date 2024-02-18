// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/Base64.sol";

contract Character1 {
    //SEBIRATCHI
    using Strings for uint256;

    string[10] public colorNames = [
        "FFFFFF",
        "FF0000",
        "008000",
        "0000FF",
        "FFFF00",
        "00FFFF",
        "800000",
        "808000",
        "800080",
        "808080"
    ];

    function generateRandomNumber(
        uint256 prevEntropy
    ) public view returns (uint256) {
        uint256 randomNumber = uint256(
            keccak256(
                abi.encode(
                    prevEntropy,
                    block.timestamp,
                    block.prevrandao,
                    blockhash(block.number - 1)
                )
            )
        );
        return uint256(randomNumber % 10);
    }

    function generateCharacter() public view returns (string memory) {
        string[3] memory colors;
        uint256[3] memory previous;
        previous[0] = generateRandomNumber(0);
        colors[0] = colorNames[previous[0]];
        previous[1] = generateRandomNumber(previous[0]);
        colors[1] = colorNames[generateRandomNumber(previous[1])];
        previous[2] = generateRandomNumber(previous[1]);
        colors[2] = colorNames[generateRandomNumber(previous[2])];
        bytes memory svg = abi.encodePacked(
            '<svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="500px" height="500px" style="shape-rendering:geometricPrecision; text-rendering:geometricPrecision; image-rendering:optimizeQuality; fill-rule:evenodd; clip-rule:evenodd" xmlns:xlink="http://www.w3.org/1999/xlink">',
            "<g>",
            '<path style="opacity:1" fill="#fefefe" d="M -0.5,-0.5 C 166.167,-0.5 332.833,-0.5 499.5,-0.5C 499.5,166.167 499.5,332.833 499.5,499.5C 332.833,499.5 166.167,499.5 -0.5,499.5C -0.5,332.833 -0.5,166.167 -0.5,-0.5 Z" />',
            "</g>",
            "<g>",
            '<path style="opacity:1" fill="#124d82" d="M 215.5,80.5 C 229.883,79.3582 241.216,84.6915 249.5,96.5C 270.088,78.7984 291.422,77.965 313.5,94C 317.206,98.3609 320.039,103.194 322,108.5C 332.663,100.959 344.496,98.4591 357.5,101C 372.031,107.568 377.365,118.734 373.5,134.5C 389.204,136.692 399.704,145.358 405,160.5C 406.278,167.476 405.111,173.976 401.5,180C 420.679,189.188 427.846,204.021 423,224.5C 419.882,229.286 416.382,233.786 412.5,238C 422.968,244.723 426.801,254.223 424,266.5C 422.861,270.112 421.194,273.446 419,276.5C 414.984,280.348 411.151,284.348 407.5,288.5C 415.774,292.714 418.94,299.381 417,308.5C 415.445,314.186 412.945,319.353 409.5,324C 416.835,326.67 421.335,331.837 423,339.5C 425.699,349.654 423.032,357.988 415,364.5C 414.989,367.659 414.155,370.493 412.5,373C 405.61,375.944 398.61,378.611 391.5,381C 368.889,385.32 346.222,389.32 323.5,393C 310.15,393.285 296.816,393.785 283.5,394.5C 284.112,400.164 282.446,404.998 278.5,409C 259.928,418.238 240.595,420.572 220.5,416C 218.032,413.512 215.699,411.012 213.5,408.5C 204.195,409.614 194.862,409.781 185.5,409C 174.269,406.467 169.435,399.634 171,388.5C 173.618,383.884 177.451,380.717 182.5,379C 167.814,364.797 157.314,347.964 151,328.5C 148.255,313.534 145.755,298.534 143.5,283.5C 123.543,285.339 104.876,281.506 87.5,272C 84,268.5 80.5,265 77,261.5C 71.2,246.245 76.0334,235.412 91.5,229C 94.5,228.667 97.5,228.333 100.5,228C 84.0316,210.649 86.0316,195.983 106.5,184C 112.394,182.963 118.061,183.629 123.5,186C 128.968,190.467 134.135,195.3 139,200.5C 143.705,168.741 160.039,145.074 188,129.5C 185.236,106.352 194.403,90.0183 215.5,80.5 Z" />',
            "</g>",
            "<g>",
            '<path style="opacity:1" fill="#134c59" d="M 277.5,116.5 C 274.57,115.701 271.57,115.368 268.5,115.5C 262.167,115.5 255.833,115.5 249.5,115.5C 259.687,114.543 270.021,114.043 280.5,114C 279.167,114.333 277.833,114.667 276.5,115C 277.056,115.383 277.389,115.883 277.5,116.5 Z" />',
            "</g>",
            "<g>",
            '<path style="opacity:1" fill="#789255" d="M 268.5,115.5 C 271.57,115.368 274.57,115.701 277.5,116.5C 278.167,116.5 278.5,116.833 278.5,117.5C 274.96,117.247 271.627,116.581 268.5,115.5 Z" />',
            "</g>",
            "<g>",
            '<path style="opacity:1" fill="#fdf007" d="M 249.5,115.5 C 255.833,115.5 262.167,115.5 268.5,115.5C 271.627,116.581 274.96,117.247 278.5,117.5C 280.903,117.448 283.236,117.781 285.5,118.5C 289.341,120.003 293.341,121.336 297.5,122.5C 324.115,132.605 345.282,149.605 361,173.5C 363.735,178.299 365.902,183.299 367.5,188.5C 367.763,192.346 369.097,195.68 371.5,198.5C 373.117,201.189 374.117,204.189 374.5,207.5C 375.162,211.466 375.495,215.466 375.5,219.5C 375.397,226.386 376.064,233.053 377.5,239.5C 377.833,239.5 378.167,239.5 378.5,239.5C 378.5,255.509 378.166,271.509 377.5,287.5C 375.779,292.562 374.779,297.895 374.5,303.5C 373.833,307.5 373.167,311.5 372.5,315.5C 371.836,317.978 371.503,320.645 371.5,323.5C 371.337,327.777 372.003,331.777 373.5,335.5C 374.643,343.616 378.31,350.45 384.5,356C 391.714,359.291 398.714,362.958 405.5,367C 394.883,371.9 383.883,375.067 372.5,376.5C 362.741,377.691 353.074,379.357 343.5,381.5C 340.505,381.294 337.838,381.96 335.5,383.5C 333.833,383.5 332.167,383.5 330.5,383.5C 308.863,385.013 287.196,386.347 265.5,387.5C 258.489,387.294 251.489,386.961 244.5,386.5C 230.736,385.637 217.069,383.971 203.5,381.5C 201.967,379.755 199.967,378.755 197.5,378.5C 191.372,375.887 186.205,371.887 182,366.5C 172.984,355.494 165.651,343.494 160,330.5C 158.463,321.314 156.63,312.314 154.5,303.5C 154.415,297.863 153.415,292.529 151.5,287.5C 151.81,284.287 151.477,281.287 150.5,278.5C 150.196,277.85 149.863,277.183 149.5,276.5C 138.47,275.79 127.47,275.124 116.5,274.5C 108.548,272.702 100.881,269.869 93.5,266C 90,262.5 86.5,259 83,255.5C 81.7362,248.085 84.2362,242.251 90.5,238C 91.7932,237.51 93.1266,237.343 94.5,237.5C 99.2723,237.522 103.939,238.189 108.5,239.5C 112.642,240.532 116.642,241.866 120.5,243.5C 123.308,245.439 126.308,247.272 129.5,249C 136.263,250.191 142.929,251.691 149.5,253.5C 151.102,255.074 153.102,255.741 155.5,255.5C 159.514,255.666 163.514,255.499 167.5,255C 169.648,252.925 169.982,250.592 168.5,248C 159.981,247.965 151.648,246.798 143.5,244.5C 139.818,242.236 135.818,240.57 131.5,239.5C 117.096,233.597 105.929,223.93 98,210.5C 97.3333,207.5 97.3333,204.5 98,201.5C 101.201,197.964 104.701,194.797 108.5,192C 111.5,191.333 114.5,191.333 117.5,192C 124.803,198.302 131.803,204.968 138.5,212C 141.742,212.986 144.408,212.152 146.5,209.5C 147.487,206.232 147.82,202.898 147.5,199.5C 149.13,195.089 150.13,190.422 150.5,185.5C 158.905,162.256 174.238,145.089 196.5,134C 213.039,124.764 230.705,118.597 249.5,115.5 Z" />',
            "</g>",
            "<g>",
            '<path style="opacity:1" fill="#4d7254" d="M 285.5,118.5 C 290.151,118.494 294.151,119.827 297.5,122.5C 293.341,121.336 289.341,120.003 285.5,118.5 Z" />',
            "</g>",
            "<g>",
            '<path style="opacity:1" fill="#2d5666" d="M 187.5,178.5 C 182.241,178.016 177.241,178.683 172.5,180.5C 176.911,174.774 181.911,174.107 187.5,178.5 Z" />',
            "</g>",
            "<g>",
            '<path style="opacity:1" fill="#114d80" d="M 187.5,178.5 C 189.017,178.511 190.184,179.177 191,180.5C 195.319,188.423 194.153,195.256 187.5,201C 176.536,203.209 170.536,198.709 169.5,187.5C 169.193,184.512 170.193,182.179 172.5,180.5C 177.241,178.683 182.241,178.016 187.5,178.5 Z" />',
            "</g>",
            "<g>",
            '<path style="opacity:1" fill="#b7c34b" d="M 150.5,185.5 C 150.13,190.422 149.13,195.089 147.5,199.5C 147.044,194.404 148.044,189.738 150.5,185.5 Z" />',
            "</g>",
            "<g>",
            '<path style="opacity:1" fill="#bbc551" d="M 367.5,188.5 C 368.117,188.611 368.617,188.944 369,189.5C 370.131,192.445 370.964,195.445 371.5,198.5C 369.097,195.68 367.763,192.346 367.5,188.5 Z" />',
            "</g>",
            "<g>",
            '<path style="opacity:1" fill="#275374" d="M 263.5,212.5 C 258.882,211.761 255.549,213.427 253.5,217.5C 254.952,219.979 254.452,221.979 252,223.5C 251.5,223.167 251,222.833 250.5,222.5C 252.05,218.828 251.55,218.161 249,220.5C 246.963,226.187 248.796,228.854 254.5,228.5C 254.5,229.5 254.5,230.5 254.5,231.5C 252.738,231.643 251.071,231.309 249.5,230.5C 248.522,230.977 247.689,231.643 247,232.5C 247.288,229.209 246.788,225.875 245.5,222.5C 244.511,226.107 244.177,229.774 244.5,233.5C 241.445,227.388 242.278,221.721 247,216.5C 251.338,210.19 256.838,208.857 263.5,212.5 Z" />',
            "</g>",
            "<g>",
            '<path style="opacity:1" fill="#094c82" d="M 263.5,212.5 C 267.378,214.533 269.378,217.7 269.5,222C 269.259,225.207 268.759,228.374 268,231.5C 267.004,233.66 265.504,235.327 263.5,236.5C 258.821,236.666 254.155,236.499 249.5,236C 250.711,235.107 250.711,234.274 249.5,233.5C 247.872,234.535 246.205,234.535 244.5,233.5C 244.177,229.774 244.511,226.107 245.5,222.5C 246.788,225.875 247.288,229.209 247,232.5C 247.689,231.643 248.522,230.977 249.5,230.5C 251.071,231.309 252.738,231.643 254.5,231.5C 254.5,230.5 254.5,229.5 254.5,228.5C 248.796,228.854 246.963,226.187 249,220.5C 251.55,218.161 252.05,218.828 250.5,222.5C 251,222.833 251.5,223.167 252,223.5C 254.452,221.979 254.952,219.979 253.5,217.5C 255.549,213.427 258.882,211.761 263.5,212.5 Z" />',
            "</g>",
            "<g>",
            '<path style="opacity:1" fill="#baca55" d="M 375.5,219.5 C 377.039,225.937 377.706,232.604 377.5,239.5C 376.064,233.053 375.397,226.386 375.5,219.5 Z" />',
            "</g>",
            "<g>",
            '<path style="opacity:1" fill="#20515e" d="M 374.5,207.5 C 376.299,212.429 377.466,217.762 378,223.5C 378.499,228.823 378.666,234.156 378.5,239.5C 378.167,239.5 377.833,239.5 377.5,239.5C 377.706,232.604 377.039,225.937 375.5,219.5C 375.495,215.466 375.162,211.466 374.5,207.5 Z" />',
            "</g>",
            "<g>",
            '<path style="opacity:1" fill="#2a505a" d="M 244.5,233.5 C 246.205,234.535 247.872,234.535 249.5,233.5C 250.711,234.274 250.711,235.107 249.5,236C 254.155,236.499 258.821,236.666 263.5,236.5C 259.469,238.439 255.136,238.939 250.5,238C 247.894,237.208 245.894,235.708 244.5,233.5 Z" />',
            "</g>",
            "<g>",
            '<path style="opacity:1" fill="#587954" d="M 94.5,237.5 C 96.9664,236.366 99.633,236.199 102.5,237C 104.974,237.037 106.974,237.87 108.5,239.5C 103.939,238.189 99.2723,237.522 94.5,237.5 Z" />',
            "</g>",
            '<g fill="#',
            colors[0],
            '">',
            '<path style="opacity:1" d="M 218.5,88.5 C 232.158,88.8392 240.825,95.5059 244.5,108.5C 238.758,109.235 233.091,110.402 227.5,112C 216.454,115.509 205.787,119.676 195.5,124.5C 195.109,107.269 202.775,95.2694 218.5,88.5 Z" />',
            '<path style="opacity:1" d="M 276.5,90.5 C 288.878,89.9033 299.711,93.57 309,101.5C 313.25,106.181 314.417,111.515 312.5,117.5C 311.833,117.833 311.167,118.167 310.5,118.5C 292.398,110.371 273.398,106.537 253.5,107C 258.782,98.0385 266.449,92.5385 276.5,90.5 Z" />',
            '<path style="opacity:1" d="M 341.5,108.5 C 360.597,106.427 368.431,114.761 365,133.5C 362.447,137.158 361.114,141.158 361,145.5C 364.61,148.381 367.777,147.881 370.5,144C 375.476,142.962 380.142,143.628 384.5,146C 391.753,151.012 396.087,157.845 397.5,166.5C 397.458,171.918 395.291,176.251 391,179.5C 390.333,181.167 390.333,182.833 391,184.5C 395.968,187.401 401.135,189.901 406.5,192C 420.868,207.749 419.702,222.249 403,235.5C 398.43,242.4 400.263,245.9 408.5,246C 415.067,250.021 417.567,255.854 416,263.5C 415.751,266.177 414.751,268.51 413,270.5C 405.816,276.505 399.983,283.505 395.5,291.5C 396.509,294.836 398.842,296.336 402.5,296C 405.102,296.883 407.269,298.383 409,300.5C 409.611,304.682 408.944,308.682 407,312.5C 403.441,318.039 399.941,323.539 396.5,329C 396.585,330.107 396.919,331.107 397.5,332C 411.659,330.832 417.493,337.332 415,351.5C 413.695,354.638 411.529,356.971 408.5,358.5C 402.652,355.41 396.652,352.577 390.5,350C 380.883,340.447 377.716,328.947 381,315.5C 387.578,279.619 388.245,243.619 383,207.5C 376.243,179.14 361.743,155.64 339.5,137C 332.739,131.971 326.073,126.971 319.5,122C 321.154,119.013 323.487,116.679 326.5,115C 331.477,112.517 336.477,110.35 341.5,108.5 Z" />',
            "</g>",
            "<g>",
            '<path style="opacity:1" fill="#356058" d="M 131.5,239.5 C 135.818,240.57 139.818,242.236 143.5,244.5C 140.017,243.248 136.351,242.414 132.5,242C 131.748,241.329 131.414,240.496 131.5,239.5 Z" />',
            "</g>",
            "<g>",
            '<path style="opacity:1" fill="#fbd16c" d="M 265.5,248.5 C 261.481,248.646 257.481,248.979 253.5,249.5C 253.611,248.883 253.944,248.383 254.5,248C 258.358,247.19 262.024,247.357 265.5,248.5 Z" />',
            "</g>",
            "<g>",
            '<path style="opacity:1" fill="#18507a" d="M 120.5,243.5 C 123.209,244.013 125.709,245.013 128,246.5C 128.945,246.095 129.612,245.428 130,244.5C 130.75,245.126 131.584,245.626 132.5,246C 131.692,246.308 131.025,246.808 130.5,247.5C 131.667,247.833 132.833,248.167 134,248.5C 137.65,247.8 140.817,246.466 143.5,244.5C 151.648,246.798 159.981,247.965 168.5,248C 169.982,250.592 169.648,252.925 167.5,255C 163.514,255.499 159.514,255.666 155.5,255.5C 153.898,253.926 151.898,253.259 149.5,253.5C 142.929,251.691 136.263,250.191 129.5,249C 126.308,247.272 123.308,245.439 120.5,243.5 Z" />',
            "</g>",
            "<g>",
            '<path style="opacity:1" fill="#98ad73" d="M 149.5,253.5 C 151.898,253.259 153.898,253.926 155.5,255.5C 153.102,255.741 151.102,255.074 149.5,253.5 Z" />',
            "</g>",
            '<g fill="#',
            colors[1],
            '">',
            '<path style="opacity:1" d="M 265.5,248.5 C 271.534,249.517 276.867,252.183 281.5,256.5C 282.63,257.622 283.297,258.956 283.5,260.5C 283.5,263.167 283.5,265.833 283.5,268.5C 283.378,272.147 281.712,274.981 278.5,277C 276.075,278.213 273.741,279.379 271.5,280.5C 264.11,280.764 256.777,280.43 249.5,279.5C 239.293,274.814 236.293,267.148 240.5,256.5C 244.159,252.824 248.493,250.491 253.5,249.5C 257.481,248.979 261.481,248.646 265.5,248.5 Z" />',
            "</g>",
            "<g>",
            '<path style="opacity:1" fill="#f1b593" d="M 283.5,260.5 C 285.026,261.492 285.693,262.992 285.5,265C 285.392,266.681 284.725,267.848 283.5,268.5C 283.5,265.833 283.5,263.167 283.5,260.5 Z" />',
            "</g>",
            "<g>",
            '<path style="opacity:1" fill="#0b4b8a" d="M 116.5,274.5 C 127.47,275.124 138.47,275.79 149.5,276.5C 149.863,277.183 150.196,277.85 150.5,278.5C 149.833,286.5 149.167,286.5 148.5,278.5C 141.468,278.17 134.468,278.503 127.5,279.5C 132.812,280.437 138.146,280.437 143.5,279.5C 143.5,280.5 143.5,281.5 143.5,282.5C 135.978,282.569 128.645,282.235 121.5,281.5C 122.325,280.614 123.325,280.281 124.5,280.5C 124.5,279.5 124.5,278.5 124.5,277.5C 122.738,277.357 121.071,277.691 119.5,278.5C 117.547,277.239 115.547,276.073 113.5,275C 114.448,274.517 115.448,274.351 116.5,274.5 Z" />',
            "</g>",
            "<g>",
            '<path style="opacity:1" fill="#f2b592" d="M 249.5,279.5 C 256.777,280.43 264.11,280.764 271.5,280.5C 264.697,282.973 257.697,283.14 250.5,281C 249.944,280.617 249.611,280.117 249.5,279.5 Z" />',
            "</g>",
            "<g>",
            '<path style="opacity:1" fill="#315a6d" d="M 300.5,280.5 C 299.022,280.238 297.689,280.571 296.5,281.5C 298.286,293.322 299.12,305.322 299,317.5C 299.383,316.944 299.883,316.611 300.5,316.5C 300.5,320.167 300.5,323.833 300.5,327.5C 299.539,325.735 299.205,323.735 299.5,321.5C 299.25,320.078 298.417,319.078 297,318.5C 296.833,306.819 296.333,295.152 295.5,283.5C 294.502,292.141 294.169,300.808 294.5,309.5C 294.167,309.5 293.833,309.5 293.5,309.5C 293.334,300.494 293.5,291.494 294,282.5C 295.525,279.5 297.692,278.833 300.5,280.5 Z" />',
            "</g>",
            "<g>",
            '<path style="opacity:1" fill="#0c4c89" d="M 300.5,280.5 C 301.833,292.5 301.833,304.5 300.5,316.5C 299.883,316.611 299.383,316.944 299,317.5C 299.12,305.322 298.286,293.322 296.5,281.5C 297.689,280.571 299.022,280.238 300.5,280.5 Z" />',
            "</g>",
            "<g>",
            '<path style="opacity:1" fill="#3f6457" d="M 151.5,287.5 C 153.415,292.529 154.415,297.863 154.5,303.5C 152.546,298.608 151.546,293.274 151.5,287.5 Z" />',
            "</g>",
            "<g>",
            '<path style="opacity:1" fill="#557755" d="M 377.5,287.5 C 377.38,293.259 376.38,298.592 374.5,303.5C 374.779,297.895 375.779,292.562 377.5,287.5 Z" />',
            "</g>",
            "<g>",
            '<path style="opacity:1" fill="#054a8e" d="M 299.5,321.5 C 298.883,321.611 298.383,321.944 298,322.5C 295.015,318.78 293.848,314.447 294.5,309.5C 294.169,300.808 294.502,292.141 295.5,283.5C 296.333,295.152 296.833,306.819 297,318.5C 298.417,319.078 299.25,320.078 299.5,321.5 Z" />',
            "</g>",
            "<g>",
            '<path style="opacity:1" fill="#1a4e7a" d="M 293.5,309.5 C 293.833,309.5 294.167,309.5 294.5,309.5C 293.848,314.447 295.015,318.78 298,322.5C 298.383,321.944 298.883,321.611 299.5,321.5C 299.205,323.735 299.539,325.735 300.5,327.5C 304.821,340.793 310.988,341.793 319,330.5C 322.246,321.097 323.246,311.43 322,301.5C 321.23,298.794 320.063,296.294 318.5,294C 319.148,292.56 319.481,291.06 319.5,289.5C 324.048,289.199 327.215,291.199 329,295.5C 331.178,307.241 330.845,318.908 328,330.5C 324.859,337.305 320.026,342.472 313.5,346C 302.439,346.623 295.605,341.456 293,330.5C 292.325,323.472 292.492,316.472 293.5,309.5 Z" />',
            "</g>",
            "<g>",
            '<path style="opacity:1" fill="#507962" d="M 372.5,315.5 C 372.391,322.196 372.724,328.863 373.5,335.5C 372.003,331.777 371.337,327.777 371.5,323.5C 371.503,320.645 371.836,317.978 372.5,315.5 Z" />',
            "</g>",
            "<g>",
            '<path style="opacity:1" fill="#51784f" d="M 197.5,378.5 C 199.967,378.755 201.967,379.755 203.5,381.5C 201.033,381.245 199.033,380.245 197.5,378.5 Z" />',
            "</g>",
            "<g>",
            '<path style="opacity:1" fill="#2c5762" d="M 372.5,376.5 C 369.454,377.987 366.121,378.987 362.5,379.5C 363.5,380.167 364.5,380.833 365.5,381.5C 364.833,381.833 364.167,382.167 363.5,382.5C 359.838,380.151 356.171,379.984 352.5,382C 353.833,382.333 355.167,382.667 356.5,383C 352.195,382.923 347.862,382.756 343.5,382.5C 343.5,382.167 343.5,381.833 343.5,381.5C 353.074,379.357 362.741,377.691 372.5,376.5 Z" />',
            "</g>",
            "<g>",
            '<path style="opacity:1" fill="#6d823c" d="M 343.5,381.5 C 343.5,381.833 343.5,382.167 343.5,382.5C 340.873,383.092 338.206,383.425 335.5,383.5C 337.838,381.96 340.505,381.294 343.5,381.5 Z" />',
            "</g>",
            "<g>",
            '<path style="opacity:1" fill="#265354" d="M 330.5,383.5 C 330.389,384.117 330.056,384.617 329.5,385C 327.5,385.333 325.5,385.667 323.5,386C 310.111,386.075 296.778,386.742 283.5,388C 272.5,388.667 261.5,388.667 250.5,388C 248.292,387.809 246.292,387.309 244.5,386.5C 251.489,386.961 258.489,387.294 265.5,387.5C 287.196,386.347 308.863,385.013 330.5,383.5 Z" />',
            "</g>",
            '<g fill="#',
            colors[2],
            '">',
            '<path style="opacity:1" d="M 185.5,386.5 C 188.85,386.335 192.183,386.502 195.5,387C 203.942,389.944 212.608,391.944 221.5,393C 219.05,396.126 216.05,398.459 212.5,400C 202.375,402.326 192.375,401.992 182.5,399C 179.291,397.417 178.124,394.917 179,391.5C 180.805,389.174 182.972,387.508 185.5,386.5 Z" />',
            '<path style="opacity:1" d="M 241.5,394.5 C 252.156,395.111 262.823,395.611 273.5,396C 274.982,398.592 274.648,400.925 272.5,403C 258.003,408.7 243.003,411.034 227.5,410C 223.756,408.249 222.756,405.415 224.5,401.5C 229.362,399.792 234.362,398.292 239.5,397C 240.381,396.292 241.047,395.458 241.5,394.5 Z" />',
            "</g>",
            "</svg>"
        );
        return
            string(
                abi.encodePacked(
                    "data:image/svg+xml;base64,",
                    Base64.encode(svg)
                )
            );
    }
}