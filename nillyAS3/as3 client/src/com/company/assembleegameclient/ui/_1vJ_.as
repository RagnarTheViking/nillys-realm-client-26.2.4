package com.company.assembleegameclient.ui
{
   import flash.display.Sprite;
   import flash.display.Bitmap;
   import _1gF_.SimpleText;
   import _1xa._jR_;
   import com.company.assembleegameclient.objects.GameObject;
   import _f7.Signal;
   import com.company.assembleegameclient.objects.Player;
   import flash.geom.ColorTransform;
   import com.company.util.MoreColorUtil;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   import com.company.assembleegameclient.parameters.Parameters;
   import flash.filters.DropShadowFilter;
   
   public class _1vJ_ extends Sprite
   {
       
      
      public var avatar:Bitmap;
      
      private var text:SimpleText;
      
      private var _1r5:_jR_;
      
      private var color:uint;
      
      public var isHtml:Boolean;
      
      public var displayRank:Boolean;
      
      public var go:GameObject;
      
      public var txtChangedSignal:Signal;
      
      private var objName:String;
      
      private var type:int;
      
      private var level:int;
      
      private var multiLine:Boolean;
      
      private var player_:Player;
      
      public function _1vJ_(param1:uint, param2:Boolean, param3:GameObject, param4:Boolean = false)
      {
         super();
         this.multiLine = param4;
         this.isHtml = param2;
         this.color = param1;
         this.avatar = new Bitmap();
         this.avatar.x = -4;
         this.avatar.y = !!param4?Number(-1):Number(-4);
         addChild(this.avatar);
         this.text = new SimpleText().setSize(13).setColor(param1).setHTML(param2);
         if(!param2)
         {
            this.text.setTextWidth(66).setTextHeight(20).setBold(true);
         }
         this.text.x = 32;
         this.text.y = 6;
         this.text.filters = [new DropShadowFilter(0,0,0)];
         addChild(this.text);
         this.txtChangedSignal = this.text.textChanged;
         this.draw(param3);
      }
      
      public function draw(param1:GameObject, param2:ColorTransform = null) : void
      {
         var _loc3_:Boolean = false;
         _loc3_ = this._8D_();
         this.go = param1;
         visible = param1 != null;
         if(visible && (this._0J_O_() || _loc3_))
         {
            this.redraw();
            transform.colorTransform = param2 || MoreColorUtil.identity;
         }
      }
      
      public function clear() : void
      {
         this.go = null;
         visible = false;
      }
      
      public function _8D_() : Boolean
      {
         return this.go == null && visible == false;
      }
      
      private function _0J_O_() : Boolean
      {
         var _loc1_:Boolean = this.go.name_ != this.objName || this.go.level_ != this.level || this.go.objectType_ != this.type;
         _loc1_ && this._O_k();
         return _loc1_;
      }
      
      private function _O_k() : void
      {
         this.objName = this.go.name_;
         this.level = this.go.level_;
         this.type = this.go.objectType_;
         this.player_ = this.go as Player;
      }
      
      private function redraw() : void
      {
         this.avatar.bitmapData = this.go.getPortrait();
         this.text.setStringBuilder(this._1fJ_());
         this.text.setColor(this._1R_B_());
         this.text.update();
      }
      
      private function _1fJ_() : _jR_
      {
         this._1r5 = this._1r5 || new _jR_();
         if(this.isHtml)
         {
            this._1li();
         }
         else if(this._cq())
         {
            this._1r5._1F_v(this.objName);
         }
         else
         {
            this._1r5._1F_v(ObjectLibrary._O_S_[this.type]);
         }
         return this._1r5;
      }
      
      private function _1li() : void
      {
         var _loc1_:String = null;
         var _loc2_:Object = {};
         if(this._cq())
         {
            if(this.multiLine)
            {
               _loc1_ = "<b>{name}</b> ({type}{level})\n<b>Account ID:</b> {accId}";
            }
            else
            {
               _loc1_ = "<b>{name}</b> ({type}{level}) <b>Account ID:</b> {accId}";
            }
            if(this.go.name_.length > 8 && !this.multiLine)
            {
               _loc2_.name = this.go.name_.slice(0,6) + "...";
            }
            else
            {
               _loc2_.name = this.go.name_;
            }
            _loc2_.type = ObjectLibrary._O_S_[this.type];
            _loc2_.level = this.level < 1?"":" " + this.level;
            _loc2_.accId = this.player_.accountId_;
         }
         else
         {
            _loc1_ = "<b>{name}</b>";
            _loc2_.name = ObjectLibrary._O_S_[this.type];
         }
         this._1r5._1F_v(_loc1_,_loc2_);
      }
      
      private function _cq() : Boolean
      {
         return this.go.name_ != null && this.go.name_ != "";
      }
      
      private function _1R_B_() : int
      {
         var _loc1_:Player = this.go as Player;
         if(_loc1_ == null)
         {
            return this.color;
         }
         if(_loc1_._0xU_)
         {
            return Parameters._0O_7;
         }
         if(_loc1_.nameChosen_)
         {
            return Parameters._1pF_;
         }
         return this.color;
      }
   }
}
