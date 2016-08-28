package com.company.assembleegameclient.screens.charrects
{
   import flash.display.Sprite;
   import _0E_T_._1zi;
   import _v4.Client;
   import kabam.rotmg.assets.services._0pW_;
   import _f7.Signal;
   import flash.display.DisplayObject;
   import com.company.assembleegameclient.appengine.SavedCharacter;
   import _0E_T_._0ih;
   import _0E_T_._Y_F_;
   import flash.display.BitmapData;
   import flash.display.Bitmap;
   import flash.events.Event;
   import _P_N_.FancyDialog;
   import _1O_R_.Dialog;
   import com.company.assembleegameclient.appengine._0Z_6;
   import _0H_6.GameContext;
   import _wi.Injector;
   import flash.events.MouseEvent;
   
   public class CharacterRectList extends Sprite
   {
       
      
      private var classes:_1zi;
      
      private var model:Client;
      
      private var assetFactory:_0pW_;
      
      public var newCharacter:Signal;
      
      public var buyCharacterSlot:Signal;
      
      public function CharacterRectList()
      {
         var _loc1_:SavedCharacter = null;
         var _loc2_:BuyCharacterRect = null;
         var _loc3_:_0ih = null;
         var _loc4_:_0Z_6 = null;
         var _loc5_:CurrentCharacterRect = null;
         var _loc6_:int = 0;
         var _loc7_:CreateNewCharacterRect = null;
         super();
         var _loc8_:Injector = GameContext.getInjector();
         this.classes = _loc8_.getInstance(_1zi);
         this.model = _loc8_.getInstance(Client);
         this.assetFactory = _loc8_.getInstance(_0pW_);
         this.newCharacter = new Signal();
         this.buyCharacterSlot = new Signal();
         var _loc9_:String = this.model.getName();
         var _loc10_:int = 4;
         var _loc11_:Vector.<SavedCharacter> = this.model.getSavedCharacters();
         for each(_loc1_ in _loc11_)
         {
            _loc3_ = this.classes._0B_M_(_loc1_.objectType());
            _loc4_ = this.model.getCharStats()[_loc1_.objectType()];
            _loc5_ = new CurrentCharacterRect(_loc9_,_loc3_,_loc1_,_loc4_);
            _loc5_.setIcon(this.getIcon(_loc1_));
            _loc5_.y = _loc10_;
            addChild(_loc5_);
            _loc10_ = _loc10_ + (CharacterRect.HEIGHT + 4);
         }
         if(this.model.hasAvailableCharSlot())
         {
            _loc6_ = 0;
            while(_loc6_ < this.model._pP_())
            {
               _loc7_ = new CreateNewCharacterRect(this.model);
               _loc7_.addEventListener(MouseEvent.MOUSE_DOWN,this.onNewChar);
               _loc7_.y = _loc10_;
               addChild(_loc7_);
               _loc10_ = _loc10_ + (CharacterRect.HEIGHT + 4);
               _loc6_++;
            }
         }
         _loc2_ = new BuyCharacterRect(this.model);
         _loc2_.addEventListener(MouseEvent.MOUSE_DOWN,this.onBuyCharSlot);
         _loc2_.y = _loc10_;
         addChild(_loc2_);
      }
      
      private function getIcon(param1:SavedCharacter) : DisplayObject
      {
         var _loc2_:_0ih = this.classes._0B_M_(param1.objectType());
         var _loc3_:_Y_F_ = _loc2_._E_G_._nV_(param1.skinType()) || _loc2_._E_G_._1sW_();
         var _loc4_:BitmapData = this.assetFactory.makeIcon(_loc3_._0C_3,100,param1.tex1(),param1.tex2());
         return new Bitmap(_loc4_);
      }
      
      private function onNewChar(param1:Event) : void
      {
         this.newCharacter.dispatch();
      }
      
      private function onBuyConfirmed(param1:Event) : void
      {
         this.buyCharacterSlot.dispatch(this.model.getNextCharSlotPrice());
      }
      
      private function onBuyCharSlot(param1:Event) : void
      {
         var dialog:FancyDialog = null;
         var _arg1:Event = param1;
         dialog = new FancyDialog("Buy Character Slot","Are you sure you want to buy a new Character Slot?","Yes","No","/offerError");
         dialog.addFullDim();
         dialog.addEventListener(Dialog.RIGHT_BUTTON,function(param1:Event):void
         {
            dialog.parent.removeChild(dialog);
         });
         dialog.addEventListener(Dialog.LEFT_BUTTON,this.onBuyConfirmed);
         parent.parent.addChild(dialog);
      }
   }
}
