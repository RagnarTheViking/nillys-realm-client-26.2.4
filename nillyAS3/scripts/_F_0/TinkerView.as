package _F_0
{
   import _0J_8._167;
   import _f7.Signal;
   import _0wX_._L_I_;
   import _T_n._1gJ_;
   import _0Q_5.URLAssetBase;
   import flash.display.DisplayObject;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import _1xa._dU_;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   import flash.events.Event;
   import flash.display.BitmapData;
   import flash.display.Bitmap;
   import flash.events.IOErrorEvent;
   import flash.net.URLRequest;
   import flash.display.Shape;
   import flash.display.Graphics;
   import _T_J_.GTween;
   import flash.display.Sprite;
   import _17B_.XImageButton;
   import _0H_6.GameContext;
   import _C_._0C_J_;
   import flash.filters.GlowFilter;
   import com.company.assembleegameclient.map._1C_n;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFieldAutoSize;
   import com.company.assembleegameclient.util.Currency;
   import _0Q_5.URLAsset;
   
   public class TinkerView extends _167
   {
      
      public static const closed:Signal = new Signal();
      
      public static const _0W_P_:int = 600;
      
      public static const _0kV_:int = 600;
      
      public static var _1bx:Class = _0A___;
      
      public static var _0ar:Class = _1eL_;
      
      public static var _xG_:Class = _B_c;
      
      public static var _F_b:Class = _W_U_;
       
      
      private var _0V_2:_L_I_;
      
      private var _T_F_:_L_I_;
      
      private var _0__q:_L_I_;
      
      public var _0mz:_1gJ_;
      
      private var _P_6:URLAssetBase;
      
      private var _3s:DisplayObject;
      
      private var _14s:int = -1;
      
      private var _0ij:DisplayObject;
      
      public function TinkerView()
      {
         this._0mz = new _1gJ_("Turn in!",36,0,Currency.INVALID,true);
         this._P_6 = new URLAsset();
         super(_0W_P_,_0kV_);
         this._0V_2 = new _L_I_(true,true);
         this._0V_2._1vP_(false);
         this._T_F_ = new _L_I_();
         this._T_F_._1vP_(true);
         this._0__q = new _L_I_();
         this._0__q._1vP_(true);
      }
      
      public function init(param1:int, param2:int, param3:String, param4:String) : void
      {
         var _loc5_:TextField = null;
         var _loc6_:TextFormat = null;
         var _loc7_:String = "Tier " + param1.toString();
         setTitle(_loc7_,true);
         this._0ij = new _xG_();
         addChild(this._0ij);
         this._0ij.x = _q9 / 4 * 1.1 - this._0ij.width / 2;
         this._0ij.y = _P_m / 20 + 2;
         this._14s = this._0ij.x + this._0ij.width / 2;
         title.setSize(20);
         title.setColor(16689154);
         title.x = _q9 / 4 * 1.1 - title.width / 2;
         title.y = this._0ij.y + this._0ij.height + 5;
         title.setBold(false);
         if(title.textField != null)
         {
            _loc6_ = title.getTextFormat(0,_loc7_.length);
            _loc6_.leading = 10;
            title.setTextFormat(_loc6_,0,_loc7_.length);
         }
         var _loc8_:TextFormat = new TextFormat();
         _loc8_.size = 13;
         _loc8_.font = "Myraid Pro";
         _loc8_.align = TextFormatAlign.CENTER;
         _loc5_ = new TextField();
         _loc5_.defaultTextFormat = _loc8_;
         _loc5_.text = "All Quests refresh daily at 5pm Pacific Time";
         _loc5_.wordWrap = true;
         _loc5_.width = 600;
         _loc5_.height = 200;
         _loc5_.y = 554;
         _loc5_.textColor = 16689154;
         _loc5_.alpha = 0.8;
         _loc5_.selectable = false;
         addChild(_loc5_);
         var _loc9_:String = _dU_._ss(ObjectLibrary._O_S_[param2]);
         this._F_V_(param3,_loc9_);
         this._uC_();
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
         addChild(this._0V_2);
         addChild(this._T_F_);
         this._T_F_._8T_();
         if(param1 == 1)
         {
            this._T_F_.visible = false;
         }
         addChild(this._0__q);
         this._0__q._0ay();
         this._0V_2._0U_u("Drag the item from your inventory into the slot",14,65535);
         this._0V_2._1hM_(this._0mz);
         addChild(this._0mz);
         this._0mz._0D_S_("Turn in!");
         this._0mz._iv(1.3);
         this._0mz._X_(2.4);
         var _loc10_:BitmapData = ObjectLibrary.getRedrawnTextureFromType(param2,80,true,false);
         this._0V_2._dZ_(new Bitmap(_loc10_));
         this._P_6 && this._P_6.unload();
         this._P_6.contentLoaderInfo.addEventListener(Event.COMPLETE,this._0t);
         this._P_6.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this._0ln);
         this._P_6.contentLoaderInfo.addEventListener(IOErrorEvent.DISK_ERROR,this._0ln);
         this._P_6.contentLoaderInfo.addEventListener(IOErrorEvent.NETWORK_ERROR,this._0ln);
         this._P_6.load(new URLRequest(param4));
         this._1fU_();
      }
      
      private function _1fU_() : void
      {
         this._0V_2.x = this._14s - this._0V_2.width / 2;
         this._0V_2.y = 350;
         this._T_F_.width = this._T_F_.width * 0.8;
         this._T_F_.height = this._T_F_.height * 0.8;
         this._T_F_.x = this._0V_2.x - this._T_F_.width;
         this._T_F_.y = this._0V_2.y + (82 - this._T_F_.height) / 2;
         this._0__q.width = this._0__q.width * 0.8;
         this._0__q.height = this._0__q.height * 0.8;
         this._0__q.x = this._0V_2.x + this._0V_2.width;
         this._0__q.y = this._0V_2.y + (82 - this._0__q.height) / 2;
         this._0mz.x = this._14s - this._0mz.width / 2;
         this._0mz.y = this._0V_2.y + 100;
         this._0mz.height = 50;
         background = this.makeModalBackground();
      }
      
      private function _08P_() : void
      {
         if(this._3s == null)
         {
            return;
         }
         this._3s.alpha = 0;
         addChild(this._3s);
         var _loc1_:int = 8;
         this._3s.x = desc.x + desc.width + 1;
         this._3s.y = _P_m / 20;
         var _loc2_:Shape = new Shape();
         var _loc3_:Graphics = _loc2_.graphics;
         _loc3_.beginFill(0);
         _loc3_.drawRect(0,0,600,550);
         _loc3_.endFill();
         addChild(_loc2_);
         this._3s.mask = _loc2_;
         new GTween(this._3s,1.25,{"alpha":1});
      }
      
      private function _0t(param1:Event) : void
      {
         this._P_6.removeEventListener(Event.COMPLETE,this._0t);
         this._P_6.removeEventListener(IOErrorEvent.IO_ERROR,this._0ln);
         this._P_6.removeEventListener(IOErrorEvent.DISK_ERROR,this._0ln);
         this._P_6.removeEventListener(IOErrorEvent.NETWORK_ERROR,this._0ln);
         if(this._3s != null && this._3s.parent != null)
         {
            removeChild(this._3s);
         }
         this._3s = DisplayObject(this._P_6);
         this._08P_();
      }
      
      private function _0ln(param1:IOErrorEvent) : void
      {
         this._P_6.removeEventListener(Event.COMPLETE,this._0t);
         this._P_6.removeEventListener(IOErrorEvent.IO_ERROR,this._0ln);
         this._P_6.removeEventListener(IOErrorEvent.DISK_ERROR,this._0ln);
         this._P_6.removeEventListener(IOErrorEvent.NETWORK_ERROR,this._0ln);
      }
      
      public function _t3() : _L_I_
      {
         return this._0V_2;
      }
      
      public function _dn() : _1gJ_
      {
         return this._0mz;
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         _1D_r.clicked.remove(this._qN_);
      }
      
      private function _qN_() : void
      {
         closed.dispatch();
      }
      
      override protected function makeModalBackground() : Sprite
      {
         x = 0;
         var _loc1_:Sprite = new Sprite();
         var _loc2_:DisplayObject = new _1bx();
         _loc2_.width = _q9;
         _loc2_.height = _P_m;
         _loc2_.alpha = 0.74;
         _loc1_.addChild(_loc2_);
         return _loc1_;
      }
      
      private function _uC_() : void
      {
         var _loc1_:XImageButton = new XImageButton(0.82);
         addChild(_loc1_);
         _loc1_.y = 4;
         _loc1_.x = _q9 - _loc1_.width - 5;
         _loc1_.clicked.add(this._qN_);
         _1D_r = _loc1_;
      }
      
      public function _1L_o() : void
      {
         this._uC_();
         var _loc1_:TextField = new TextField();
         var _loc2_:* = "ALL QUESTS COMPLETED!";
         var _loc3_:* = "";
         _loc1_.text = _loc2_ + "\n\n\n\n" + _loc3_;
         _loc1_.width = 600;
         var _loc4_:_0C_J_ = GameContext.getInjector().getInstance(_0C_J_);
         var _loc5_:TextFormat = _loc4_.apply(_loc1_,32,16777215,true,true);
         _loc1_.selectable = false;
         _loc1_.x = 0;
         _loc1_.y = 150;
         _loc1_.embedFonts = true;
         _loc1_.filters = [new GlowFilter(49941)];
         addChild(new _1C_n(1));
         addChild(_loc1_);
         _loc1_ = new TextField();
         _loc2_ = "";
         _loc3_ = "Return at 5pm Pacific Time for New Quests!";
         _loc1_.text = _loc2_ + "\n\n\n" + _loc3_;
         _loc1_.width = 600;
         _loc4_.apply(_loc1_,17,49941,false,true);
         _loc1_.selectable = false;
         _loc1_.x = 0;
         _loc1_.y = 150;
         _loc1_.embedFonts = true;
         _loc1_.filters = [new DropShadowFilter(0,0,0)];
         addChild(_loc1_);
      }
      
      public function _F_V_(param1:String, param2:String = "") : void
      {
         var _loc3_:String = null;
         var _loc4_:TextFormat = null;
         var _loc5_:int = param1.indexOf("{goal}");
         if(_loc5_ != -1)
         {
            _loc3_ = param1.split("{goal}").join(param2);
            _1U_G_(_loc3_,true);
         }
         else
         {
            _loc3_ = param1;
         }
         _1U_G_(_loc3_,true);
         desc.setColor(16689154);
         desc.setBold(false);
         desc.setSize(15);
         desc.setTextWidth(315);
         desc.x = _q9 / 4 * 1.1 - desc.width / 2 + 3;
         desc.y = title != null?Number(title.y + title.height + 6):Number(165);
         desc.setAutoSize(TextFieldAutoSize.LEFT);
         desc.setHorizontalAlign("left");
         desc.filters = [new DropShadowFilter(0,0,0)];
         desc.setLeftMargin(14);
         var _loc6_:TextFormat = desc.getTextFormat(0,_loc3_.length);
         _loc6_.leading = 4;
         desc.setTextFormat(_loc6_,0,_loc3_.length);
         if(_loc5_ != -1)
         {
            _loc4_ = desc.getTextFormat(_loc5_,_loc5_ + param2.length);
            _loc4_.color = 196098;
            _loc4_.bold = true;
            desc.setTextFormat(_loc4_,_loc5_,_loc5_ + param2.length);
         }
      }
      
      public function _0D_7() : void
      {
         var _loc2_:DisplayObject = null;
         var _loc1_:DisplayObject = new _0ar();
         _loc1_.x = 120;
         _loc1_.y = 180;
         _loc1_.scaleX = 0.1;
         _loc1_.scaleY = 0.1;
         new GTween(_loc1_,0.4,{
            "alpha":1,
            "scaleX":0.6,
            "scaleY":0.6,
            "x":30,
            "y":130
         });
         addChild(_loc1_);
         _loc2_ = new _F_b();
         _loc2_.x = this._3s.x + 4;
         _loc2_.y = this._3s.y + 4;
         _loc2_.alpha = 0;
         addChild(_loc2_);
         new GTween(_loc2_,0.4,{"alpha":1});
         new GTween(desc,0.4,{"alpha":0.2});
         new GTween(this._0ij,0.4,{"alpha":0.2});
         new GTween(title,0.4,{"alpha":0.2});
         this._0V_2._1an(5526612);
         this._0V_2._r2();
      }
      
      public function _U_e() : void
      {
         this._0V_2._1ew(-1);
      }
   }
}
