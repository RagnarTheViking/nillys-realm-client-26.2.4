package com.company.assembleegameclient.util
{
   import _ll._mt;
   import com.company.assembleegameclient.parameters.Parameters;
   import emotes.Emotes;
   import _ll._1C_c;
   import com.company.util.TextureLibrary;
   import kabam.rotmg.assets.Assets;
   import _ll.SFX;
   import flash.utils.ByteArray;
   import com.company.assembleegameclient.engine3d._1aW_;
   import _0x1.ParticalLibrary;
   import kabam.rotmg.assets.EmbeddedData;
   import com.company.assembleegameclient.map.GroundLibrary;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   import com.company.assembleegameclient.map.RegionLibrary;
   
   public class _1B_J_
   {
      
      public static var _T_o:Boolean = false;
       
      
      public var _0U_F_:_mt;
      
      public function _1B_J_()
      {
         this._0U_F_ = new _1yh();
         super();
      }
      
      public function load() : void
      {
         Parameters.load();
         this.loadTextures();
         this.loadSprites();
         this.loadSfx();
         this._1O_g();
         this.addParticles();
         this.addGrounds();
         this.addTextures();
         this.addRegions();
         Emotes.load();
         this._0U_F_.load();
         _1C_c.load();
      }
      
      private function loadTextures() : void
      {
         TextureLibrary.add("lofiChar8x8",new Assets.lofiCharEmbed_().bitmapData,8,8);
         TextureLibrary.add("lofiChar16x8",new Assets.lofiCharEmbed_().bitmapData,16,8);
         TextureLibrary.add("lofiChar16x16",new Assets.lofiCharEmbed_().bitmapData,16,16);
         TextureLibrary.add("lofiChar28x8",new Assets.lofiChar2Embed_().bitmapData,8,8);
         TextureLibrary.add("lofiChar216x8",new Assets.lofiChar2Embed_().bitmapData,16,8);
         TextureLibrary.add("lofiChar216x16",new Assets.lofiChar2Embed_().bitmapData,16,16);
         TextureLibrary.add("lofiCharBig",new Assets.lofiCharBigEmbed_().bitmapData,16,16);
         TextureLibrary.add("lofiEnvironment",new Assets.lofiEnvironmentEmbed_().bitmapData,8,8);
         TextureLibrary.add("lofiEnvironment2",new Assets.lofiEnvironment2Embed_().bitmapData,8,8);
         TextureLibrary.add("lofiEnvironment3",new Assets.lofiEnvironment3Embed_().bitmapData,8,8);
         TextureLibrary.add("lofiInterface",new Assets.lofiInterfaceEmbed_().bitmapData,8,8);
         TextureLibrary.add("redLootBag",new Assets.redLootBagEmbed_().bitmapData,8,8);
         TextureLibrary.add("lofiInterfaceBig",new Assets.lofiInterfaceBigEmbed_().bitmapData,16,16);
         TextureLibrary.add("lofiInterface2",new Assets.lofiInterface2Embed_().bitmapData,8,8);
         TextureLibrary.add("lofiObj",new Assets.lofiObjEmbed_().bitmapData,8,8);
         TextureLibrary.add("lofiObj2",new Assets.lofiObj2Embed_().bitmapData,8,8);
         TextureLibrary.add("lofiObj3",new Assets.lofiObj3Embed_().bitmapData,8,8);
         TextureLibrary.add("lofiObj4",new Assets.lofiObj4Embed_().bitmapData,8,8);
         TextureLibrary.add("lofiObj5",new Assets.lofiObj5Embed_().bitmapData,8,8);
         TextureLibrary.add("lofiObj6",new Assets.lofiObj6Embed_().bitmapData,8,8);
         TextureLibrary.add("lofiObjBig",new Assets.lofiObjBigEmbed_().bitmapData,16,16);
         TextureLibrary.add("lofiObj40x40",new Assets.lofiObj40x40Embed_().bitmapData,40,40);
         TextureLibrary.add("lofiProjs",new Assets.lofiProjsEmbed_().bitmapData,8,8);
         TextureLibrary.add("lofiParticlesShocker",new Assets.lofiParticlesShockerEmbed_().bitmapData,16,16);
         TextureLibrary.add("lofiProjsBig",new Assets.lofiProjsBigEmbed_().bitmapData,16,16);
         TextureLibrary.add("lofiParts",new Assets.lofiPartsEmbed_().bitmapData,8,8);
         TextureLibrary.add("stars",new Assets.starsEmbed_().bitmapData,5,5);
         TextureLibrary.add("textile4x4",new Assets.textile4x4Embed_().bitmapData,4,4);
         TextureLibrary.add("textile5x5",new Assets.textile5x5Embed_().bitmapData,5,5);
         TextureLibrary.add("textile9x9",new Assets.textile9x9Embed_().bitmapData,9,9);
         TextureLibrary.add("textile10x10",new Assets.textile10x10Embed_().bitmapData,10,10);
         TextureLibrary.add("inner_mask",new Assets.innerMaskEmbed_().bitmapData,4,4);
         TextureLibrary.add("sides_mask",new Assets.sidesMaskEmbed_().bitmapData,4,4);
         TextureLibrary.add("outer_mask",new Assets.outerMaskEmbed_().bitmapData,4,4);
         TextureLibrary.add("innerP1_mask",new Assets.innerP1MaskEmbed_().bitmapData,4,4);
         TextureLibrary.add("innerP2_mask",new Assets.innerP2MaskEmbed_().bitmapData,4,4);
         TextureLibrary.add("invisible",new _1wr(8,8,true,0),8,8);
         TextureLibrary.add("d3LofiObjEmbed",new Assets.d3LofiObjEmbed_().bitmapData,8,8);
         TextureLibrary.add("d3LofiObjBigEmbed",new Assets.d3LofiObjBigEmbed_().bitmapData,16,16);
         TextureLibrary.add("d1lofiObjBig",new Assets.d1LofiObjBigEmbed_().bitmapData,16,16);
         TextureLibrary.add("emotes",new Assets.emotesEmbed_().bitmapData,16,16);
         TextureLibrary.add("proCursor",new Assets.proCursor_().bitmapData,32,32);
         TextureLibrary.add("nrCursor",new Assets.nrCursor_().bitmapData,32,32);
         TextureLibrary.add("FoodDungeon",new Assets.FoodDungeon().bitmapData,8,8);
      }
      
      private function loadSprites() : void
      {
         AnimatedLibrary.add("chars8x8rBeach",new Assets.chars8x8rBeachEmbed_().bitmapData,null,8,8,56,8,_Z_4.RIGHT);
         AnimatedLibrary.add("chars8x8dBeach",new Assets.chars8x8dBeachEmbed_().bitmapData,null,8,8,56,8,_Z_4.DOWN);
         AnimatedLibrary.add("chars8x8rLow1",new Assets.chars8x8rLow1Embed_().bitmapData,null,8,8,56,8,_Z_4.RIGHT);
         AnimatedLibrary.add("chars8x8rLow2",new Assets.chars8x8rLow2Embed_().bitmapData,null,8,8,56,8,_Z_4.RIGHT);
         AnimatedLibrary.add("chars8x8rMid",new Assets.chars8x8rMidEmbed_().bitmapData,null,8,8,56,8,_Z_4.RIGHT);
         AnimatedLibrary.add("chars8x8rMid2",new Assets.chars8x8rMid2Embed_().bitmapData,null,8,8,56,8,_Z_4.RIGHT);
         AnimatedLibrary.add("chars8x8rHigh",new Assets.chars8x8rHighEmbed_().bitmapData,null,8,8,56,8,_Z_4.RIGHT);
         AnimatedLibrary.add("chars8x8rHero1",new Assets.chars8x8rHero1Embed_().bitmapData,null,8,8,56,8,_Z_4.RIGHT);
         AnimatedLibrary.add("chars8x8rHero2",new Assets.chars8x8rHero2Embed_().bitmapData,null,8,8,56,8,_Z_4.RIGHT);
         AnimatedLibrary.add("chars8x8dHero1",new Assets.chars8x8dHero1Embed_().bitmapData,null,8,8,56,8,_Z_4.DOWN);
         AnimatedLibrary.add("chars16x16dMountains1",new Assets.chars16x16dMountains1Embed_().bitmapData,null,16,16,112,16,_Z_4.DOWN);
         AnimatedLibrary.add("chars16x16dMountains2",new Assets.chars16x16dMountains2Embed_().bitmapData,null,16,16,112,16,_Z_4.DOWN);
         AnimatedLibrary.add("chars8x8dEncounters",new Assets.chars8x8dEncountersEmbed_().bitmapData,null,8,8,56,8,_Z_4.DOWN);
         AnimatedLibrary.add("chars8x8rEncounters",new Assets.chars8x8rEncountersEmbed_().bitmapData,null,8,8,56,8,_Z_4.RIGHT);
         AnimatedLibrary.add("chars16x8dEncounters",new Assets.chars16x8dEncountersEmbed_().bitmapData,null,16,8,112,8,_Z_4.DOWN);
         AnimatedLibrary.add("chars16x8rEncounters",new Assets.chars16x8rEncountersEmbed_().bitmapData,null,16,8,112,8,_Z_4.DOWN);
         AnimatedLibrary.add("chars16x16dEncounters",new Assets.chars16x16dEncountersEmbed_().bitmapData,null,16,16,112,16,_Z_4.DOWN);
         AnimatedLibrary.add("chars16x16dEncounters2",new Assets.chars16x16dEncounters2Embed_().bitmapData,null,16,16,112,16,_Z_4.DOWN);
         AnimatedLibrary.add("chars16x16rEncounters",new Assets.chars16x16rEncountersEmbed_().bitmapData,null,16,16,112,16,_Z_4.RIGHT);
         AnimatedLibrary.add("d3Chars8x8rEmbed",new Assets.d3Chars8x8rEmbed_().bitmapData,null,8,8,56,8,_Z_4.RIGHT);
         AnimatedLibrary.add("d3Chars16x16rEmbed",new Assets.d3Chars16x16rEmbed_().bitmapData,null,16,16,112,16,_Z_4.RIGHT);
         AnimatedLibrary.add("players",new Assets.playersEmbed_().bitmapData,new Assets.playersMaskEmbed_().bitmapData,8,8,56,24,_Z_4.RIGHT);
         AnimatedLibrary.add("playerskins",new Assets.playersSkinsEmbed_().bitmapData,new Assets.playersSkinsMaskEmbed_().bitmapData,8,8,56,24,_Z_4.RIGHT);
         AnimatedLibrary.add("chars8x8rPets1",new Assets.chars8x8rPets1Embed_().bitmapData,new Assets.chars8x8rPets1MaskEmbed_().bitmapData,8,8,56,8,_Z_4.RIGHT);
         AnimatedLibrary.add("chars8x8rPets2",new Assets.chars8x8rPets2Embed_().bitmapData,new Assets.chars8x8rPets1MaskEmbed_().bitmapData,8,8,56,8,_Z_4.RIGHT);
         AnimatedLibrary.add("petsDivine",new Assets.petsDivineEmbed_().bitmapData,null,16,16,112,16,_Z_4.RIGHT);
         AnimatedLibrary.add("playerskins16",new Assets.playersSkins16Embed_().bitmapData,new Assets.playersSkins16MaskEmbed_().bitmapData,16,16,112,48,_Z_4.RIGHT);
         AnimatedLibrary.add("d1chars16x16r",new Assets.d1Chars16x16rEmbed_().bitmapData,null,16,16,112,16,_Z_4.RIGHT);
         AnimatedLibrary.add("customSkins8x8",new Assets.customSkins8x8_().bitmapData,null,8,8,56,24,_Z_4.RIGHT);
      }
      
      private function loadSfx() : void
      {
         SFX.load("button_click");
         SFX.load("death_screen");
         SFX.load("enter_realm");
         SFX.load("error");
         SFX.load("inventory_move_item");
         SFX.load("level_up");
         SFX.load("loot_appears");
         SFX.load("no_mana");
         SFX.load("use_key");
         SFX.load("use_potion");
      }
      
      private function _1O_g() : void
      {
         var _loc1_:* = null;
         var _loc2_:ByteArray = null;
         var _loc3_:String = null;
         for(_loc1_ in Assets._1sY_)
         {
            _loc2_ = Assets._1sY_[_loc1_];
            _loc3_ = _loc2_.readUTFBytes(_loc2_.length);
            _1aW_._04U_(_loc1_,_loc2_);
            _1aW_._1h3(_loc1_,_loc3_);
         }
      }
      
      private function addParticles() : void
      {
         var _loc1_:XML = XML(new Assets.particlesEmbed());
         ParticalLibrary.add(_loc1_);
      }
      
      private function addGrounds() : void
      {
         var _loc1_:* = undefined;
         for each(_loc1_ in EmbeddedData.Ground)
         {
            GroundLibrary.add(XML(_loc1_));
         }
      }
      
      private function addTextures() : void
      {
         var _loc1_:* = undefined;
         for each(_loc1_ in EmbeddedData.Textures)
         {
            ObjectLibrary.add(XML(_loc1_));
         }
      }
      
      private function addRegions() : void
      {
         var _loc1_:* = undefined;
         for each(_loc1_ in EmbeddedData.Regions)
         {
            RegionLibrary.add(XML(_loc1_));
         }
      }
   }
}
