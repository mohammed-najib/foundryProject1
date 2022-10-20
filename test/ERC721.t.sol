// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/ERC721.sol";

contract ERC721Test is Test {
    MDPanda mdPanda;
    address ahmad = address(0x1);
    address mariam = address(0x2);

    function setUp() public {
        mdPanda = new MDPanda();
    }

    function testMint() public {
        mdPanda.mint(ahmad, "testhash");
        address owner_of = mdPanda.ownerOf(0);
        assertEq(ahmad, owner_of);
    }

    function testTransfer() public {
        mdPanda.mint(ahmad, "testhash");
        vm.startPrank(ahmad);
        mdPanda.safeTransferFrom(ahmad, mariam, 0);

        address ownerOf = mdPanda.ownerOf(0);
        assertEq(mariam, ownerOf);
    }
}