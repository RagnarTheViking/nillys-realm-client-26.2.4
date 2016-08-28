package _0S_w
{
   import flash.display.Sprite;
   import _1f.Stats;
   import _1ar._0lK_;
   import _1W_l._1xS_;
   import _ki._yx;
   import flash.net.FileReference;
   import com.company.util.IntPoint;
   import flash.events.Event;
   import _1ar._0S_l;
   import com.company.util._mL_;
   import _1ar._0X_A_;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   import com.hurlant.util.Base64;
   import com.company.assembleegameclient.map.GroundLibrary;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   import com.company.assembleegameclient.map.RegionLibrary;
   import flash.net.FileFilter;
   import flash.events.IOErrorEvent;
   import _ju._0O_M_;
   import _W_Q_.TitleBasicAccountInfo;
   import _0H_6.GameContext;
   
   public class _1u5 extends Sprite
   {
      
      private static const _1Q_h:int = 600 - _0S_w._056._0lO_ - 10;
      
      public static const _0O_6:Stats = new Stats();
       
      
      public var _aO_:_0S_w._0tD_;
      
      private var _1t3:_0lK_;
      
      public var _1o5:_0S_w._056;
      
      public var _0ji:_0S_w._00A_;
      
      public var _1zF_:_1xS_;
      
      public var _1dD_:_0S_w._c2;
      
      public var _yy:_0S_w._X_D_;
      
      public var _Y_4:_0S_w._03k;
      
      public var _1T_l:_0S_w._0Z_o;
      
      public var filename_:String = null;
      
      private var _0qa:_yx;
      
      private var _1ef:FileReference = null;
      
      public function _1u5()
      {
         super();
         addChild(new _0O_M_());
         addChild(new TitleBasicAccountInfo());
         this._0qa = GameContext.getInjector().getInstance(_yx);
         this._aO_ = new _0S_w._0tD_();
         this._aO_.x = 15;
         this._aO_.y = _1Q_h;
         this._aO_.addEventListener(_0X_A_.UNDO_COMMAND_EVENT,this._0B_1);
         this._aO_.addEventListener(_0X_A_.REDO_COMMAND_EVENT,this._sx);
         this._aO_.addEventListener(_0X_A_.CLEAR_COMMAND_EVENT,this._10G_);
         this._aO_.addEventListener(_0X_A_.LOAD_COMMAND_EVENT,this._1X_m);
         this._aO_.addEventListener(_0X_A_.SAVE_COMMAND_EVENT,this._F_S_);
         this._aO_.addEventListener(_0X_A_.TEST_COMMAND_EVENT,this._1lU_);
         addChild(this._aO_);
         this._1t3 = new _0lK_();
         this._1o5 = new _0S_w._056();
         this._1o5.addEventListener(_2i.TILES_EVENT,this._1aC_);
         this._1o5.x = 800 / 2 - _0S_w._056._0lO_ / 2;
         this._1o5.y = _1Q_h;
         addChild(this._1o5);
         this._0ji = new _0S_w._00A_(this._1o5);
         this._0ji.x = 4;
         this._0ji.y = 600 - _0S_w._00A_.HEIGHT - 10;
         addChild(this._0ji);
         this._1zF_ = new _1xS_(new <String>["Ground","Objects","Regions"],_0S_w._0Z_o.WIDTH,26);
         this._1zF_.x = this._1o5.x + _0S_w._056._0lO_ + 4;
         this._1zF_.y = _1Q_h;
         this._1zF_.addEventListener(Event.CHANGE,this._wr);
         addChild(this._1zF_);
         this._1dD_ = new _0S_w._c2();
         this._1dD_.x = this._1zF_.x;
         this._1dD_.y = this._1zF_.y + this._1zF_.height + 4;
         this._1T_l = this._1dD_;
         addChild(this._1dD_);
         this._yy = new _0S_w._X_D_();
         this._yy.x = this._1zF_.x;
         this._yy.y = this._1zF_.y + this._1zF_.height + 4;
         this._Y_4 = new _0S_w._03k();
         this._Y_4.x = this._1zF_.x;
         this._Y_4.y = this._1zF_.y + this._1zF_.height + 4;
      }
      
      private function _1aC_(param1:_2i) : void
      {
         var _loc2_:IntPoint = null;
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc5_:_0zo = null;
         _loc2_ = param1.tiles_[0];
         switch(this._aO_._183())
         {
            case _0S_w._0tD_._0M_J_:
               this._iJ_(param1.tiles_,this._1T_l._P_Z_,this._1T_l._1__N_());
               break;
            case _0S_w._0tD_._2k:
               this._iJ_(param1.tiles_,this._1T_l._P_Z_,-1);
               break;
            case _0S_w._0tD_._1E_x:
               _loc3_ = this._1o5.getType(_loc2_.x_,_loc2_.y_,this._1T_l._P_Z_);
               if(_loc3_ == -1)
               {
                  return;
               }
               this._1T_l._B___(_loc3_);
               this._aO_._1S_Y_(_0S_w._0tD_._0M_J_);
               break;
            case _0S_w._0tD_._M_f:
               _loc4_ = this._1o5._0F_L_(_loc2_.x_,_loc2_.y_);
               _loc5_ = new _0zo(param1.tiles_,_loc4_);
               _loc5_.addEventListener(Event.COMPLETE,this._1mp);
               addChild(_loc5_);
         }
         this._1o5.draw();
      }
      
      private function _1mp(param1:Event) : void
      {
         var _loc2_:_0zo = param1.currentTarget as _0zo;
         this._9Y_(_loc2_.tiles_,_loc2_._0F_L_());
      }
      
      private function _iJ_(param1:Vector.<IntPoint>, param2:int, param3:int) : void
      {
         var _loc4_:IntPoint = null;
         var _loc5_:int = 0;
         var _loc6_:_0S_l = new _0S_l();
         for each(_loc4_ in param1)
         {
            _loc5_ = this._1o5.getType(_loc4_.x_,_loc4_.y_,param2);
            if(_loc5_ != param3)
            {
               _loc6_._0dm(new _11V_(this._1o5,_loc4_.x_,_loc4_.y_,param2,_loc5_,param3));
            }
         }
         if(_loc6_._Z_0())
         {
            return;
         }
         this._1t3._X_w(_loc6_);
      }
      
      private function _9Y_(param1:Vector.<IntPoint>, param2:String) : void
      {
         var _loc3_:IntPoint = null;
         var _loc4_:String = null;
         var _loc5_:_0S_l = new _0S_l();
         for each(_loc3_ in param1)
         {
            _loc4_ = this._1o5._0F_L_(_loc3_.x_,_loc3_.y_);
            if(_loc4_ != param2)
            {
               _loc5_._0dm(new _0H___(this._1o5,_loc3_.x_,_loc3_.y_,_loc4_,param2));
            }
         }
         if(_loc5_._Z_0())
         {
            return;
         }
         this._1t3._X_w(_loc5_);
      }
      
      private function _wr(param1:Event) : void
      {
         switch(this._1zF_.getValue())
         {
            case "Ground":
               _mL_._1D_5(this,this._1dD_);
               _mL_._0g1(this,this._yy);
               _mL_._0g1(this,this._Y_4);
               this._1T_l = this._1dD_;
               return;
            case "Objects":
               _mL_._0g1(this,this._1dD_);
               _mL_._1D_5(this,this._yy);
               _mL_._0g1(this,this._Y_4);
               this._1T_l = this._yy;
               return;
            case "Regions":
               _mL_._0g1(this,this._1dD_);
               _mL_._0g1(this,this._yy);
               _mL_._1D_5(this,this._Y_4);
               this._1T_l = this._Y_4;
               return;
            default:
               return;
         }
      }
      
      private function _0B_1(param1:_0X_A_) : void
      {
         this._1t3._1dv();
         this._1o5.draw();
      }
      
      private function _sx(param1:_0X_A_) : void
      {
         this._1t3._169();
         this._1o5.draw();
      }
      
      private function _10G_(param1:_0X_A_) : void
      {
         var _loc2_:IntPoint = null;
         var _loc3_:_l4 = null;
         var _loc4_:Vector.<IntPoint> = this._1o5._xi();
         var _loc5_:_0S_l = new _0S_l();
         for each(_loc2_ in _loc4_)
         {
            _loc3_ = this._1o5._1r6(_loc2_.x_,_loc2_.y_);
            if(_loc3_ != null)
            {
               _loc5_._0dm(new _0b2(this._1o5,_loc2_.x_,_loc2_.y_,_loc3_));
            }
         }
         if(_loc5_._Z_0())
         {
            return;
         }
         this._1t3._X_w(_loc5_);
         this._1o5.draw();
         this.filename_ = null;
      }
      
      private function _dd() : String
      {
         var _loc1_:int = 0;
         var _loc2_:_l4 = null;
         var _loc3_:Object = null;
         var _loc4_:String = null;
         var _loc5_:int = 0;
         var _loc6_:Rectangle = this._1o5._0E_U_();
         if(_loc6_ == null)
         {
            return null;
         }
         var _loc7_:Object = {};
         _loc7_["width"] = int(_loc6_.width);
         _loc7_["height"] = int(_loc6_.height);
         var _loc8_:Object = {};
         var _loc9_:Array = [];
         var _loc10_:ByteArray = new ByteArray();
         var _loc11_:int = _loc6_.y;
         while(_loc11_ < _loc6_.bottom)
         {
            _loc1_ = _loc6_.x;
            while(_loc1_ < _loc6_.right)
            {
               _loc2_ = this._1o5._1r6(_loc1_,_loc11_);
               _loc3_ = this._1Q_M_(_loc2_);
               _loc4_ = this._0qa.stringify(_loc3_);
               if(!_loc8_.hasOwnProperty(_loc4_))
               {
                  _loc5_ = _loc9_.length;
                  _loc8_[_loc4_] = _loc5_;
                  _loc9_.push(_loc3_);
               }
               else
               {
                  _loc5_ = _loc8_[_loc4_];
               }
               _loc10_.writeShort(_loc5_);
               _loc1_++;
            }
            _loc11_++;
         }
         _loc7_["dict"] = _loc9_;
         _loc10_.compress();
         _loc7_["data"] = Base64.encodeByteArray(_loc10_);
         return this._0qa.stringify(_loc7_);
      }
      
      private function _F_S_(param1:_0X_A_) : void
      {
         var _loc2_:String = this._dd();
         if(_loc2_ == null)
         {
            return;
         }
         new FileReference().save(_loc2_,this.filename_ == null?"map.jm":this.filename_);
      }
      
      private function _1Q_M_(param1:_l4) : Object
      {
         var _loc2_:Vector.<int> = null;
         var _loc3_:String = null;
         var _loc4_:Object = null;
         var _loc5_:Object = {};
         if(param1 != null)
         {
            _loc2_ = param1._155;
            if(_loc2_[_F_B_._1Z_v] != -1)
            {
               _loc3_ = GroundLibrary._M_(_loc2_[_F_B_._1Z_v]);
               _loc5_["ground"] = _loc3_;
            }
            if(_loc2_[_F_B_._W_a] != -1)
            {
               _loc3_ = ObjectLibrary._M_(_loc2_[_F_B_._W_a]);
               _loc4_ = {"id":_loc3_};
               if(param1._09t != null)
               {
                  _loc4_["name"] = param1._09t;
               }
               _loc5_["objs"] = [_loc4_];
            }
            if(_loc2_[_F_B_._V_4] != -1)
            {
               _loc3_ = RegionLibrary._M_(_loc2_[_F_B_._V_4]);
               _loc5_["regions"] = [{"id":_loc3_}];
            }
         }
         return _loc5_;
      }
      
      private function _1X_m(param1:_0X_A_) : void
      {
         this._1ef = new FileReference();
         this._1ef.addEventListener(Event.SELECT,this._1pR_);
         this._1ef.browse([new FileFilter("JSON Map (*.jm)","*.jm")]);
      }
      
      private function _1pR_(param1:Event) : void
      {
         var _loc2_:FileReference = param1.target as FileReference;
         _loc2_.addEventListener(Event.COMPLETE,this._0hC_);
         _loc2_.addEventListener(IOErrorEvent.IO_ERROR,this._D_7);
         try
         {
            _loc2_.load();
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      private function _0hC_(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Object = null;
         var _loc5_:Array = null;
         var _loc6_:Array = null;
         var _loc7_:Object = null;
         var _loc8_:Object = null;
         var _loc9_:FileReference = param1.target as FileReference;
         this.filename_ = _loc9_.name;
         var _loc10_:Object = this._0qa.parse(_loc9_.data.toString());
         var _loc11_:int = _loc10_["width"];
         var _loc12_:int = _loc10_["height"];
         var _loc13_:Rectangle = new Rectangle(int(_0S_w._056._0eO_ / 2 - _loc11_ / 2),int(_0S_w._056._0eO_ / 2 - _loc12_ / 2),_loc11_,_loc12_);
         this._1o5.clear();
         this._1t3.clear();
         var _loc14_:Array = _loc10_["dict"];
         var _loc15_:ByteArray = Base64.decodeToByteArray(_loc10_["data"]);
         _loc15_.uncompress();
         var _loc16_:int = _loc13_.y;
         while(_loc16_ < _loc13_.bottom)
         {
            _loc3_ = _loc13_.x;
            while(_loc3_ < _loc13_.right)
            {
               _loc4_ = _loc14_[_loc15_.readShort()];
               if(_loc4_.hasOwnProperty("ground"))
               {
                  _loc2_ = GroundLibrary._07h[_loc4_["ground"]];
                  this._1o5._yE_(_loc3_,_loc16_,_F_B_._1Z_v,_loc2_);
               }
               _loc5_ = _loc4_["objs"];
               if(_loc5_ != null)
               {
                  for each(_loc7_ in _loc5_)
                  {
                     if(ObjectLibrary._07h.hasOwnProperty(_loc7_["id"]))
                     {
                        _loc2_ = ObjectLibrary._07h[_loc7_["id"]];
                        this._1o5._yE_(_loc3_,_loc16_,_F_B_._W_a,_loc2_);
                        if(_loc7_.hasOwnProperty("name"))
                        {
                           this._1o5._1I_T_(_loc3_,_loc16_,_loc7_["name"]);
                        }
                     }
                  }
               }
               _loc6_ = _loc4_["regions"];
               if(_loc6_ != null)
               {
                  for each(_loc8_ in _loc6_)
                  {
                     _loc2_ = RegionLibrary._07h[_loc8_["id"]];
                     this._1o5._yE_(_loc3_,_loc16_,_F_B_._V_4,_loc2_);
                  }
               }
               _loc3_++;
            }
            _loc16_++;
         }
         this._1o5.draw();
      }
      
      private function _D_7(param1:Event) : void
      {
      }
      
      private function _1lU_(param1:Event) : void
      {
         dispatchEvent(new _1rW_(this._dd()));
      }
   }
}
