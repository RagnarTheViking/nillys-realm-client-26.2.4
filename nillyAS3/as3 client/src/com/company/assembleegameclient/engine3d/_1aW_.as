package com.company.assembleegameclient.engine3d
{
   import flash.utils.ByteArray;
   import _0gO_._1S_3;
   import flash.display3D.Context3D;
   import com.company.util.ConversionUtil;
   import _0gO_.Object3D;
   
   public class _1aW_
   {
      
      private static var _cZ_:Object = new Object();
      
      private static var _1J_a:Object = new Object();
       
      
      public var vL_:Vector.<Number>;
      
      public var uvts_:Vector.<Number>;
      
      public var faces_:Vector.<com.company.assembleegameclient.engine3d._py>;
      
      public function _1aW_()
      {
         this.vL_ = new Vector.<Number>();
         this.uvts_ = new Vector.<Number>();
         this.faces_ = new Vector.<com.company.assembleegameclient.engine3d._py>();
         super();
      }
      
      public static function _04U_(param1:String, param2:ByteArray) : void
      {
         var _loc3_:_1S_3 = new _1S_3();
         _loc3_.readBytes(param2);
         _1J_a[param1] = _loc3_;
      }
      
      public static function _lC_(param1:Context3D) : void
      {
         var _loc2_:_1S_3 = null;
         for each(_loc2_ in _1J_a)
         {
            _loc2_._0J_H_(param1);
         }
      }
      
      public static function _1h3(param1:String, param2:String) : void
      {
         var _loc3_:String = null;
         var _loc4_:_1aW_ = null;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc7_:Array = null;
         var _loc8_:String = null;
         var _loc9_:String = null;
         var _loc10_:Array = null;
         var _loc11_:Array = null;
         var _loc12_:String = null;
         var _loc13_:Vector.<int> = null;
         var _loc14_:int = 0;
         var _loc21_:String = null;
         var _loc15_:Array = param2.split(/\s*\n\s*/);
         var _loc16_:Array = [];
         var _loc17_:Array = [];
         var _loc18_:Array = [];
         var _loc19_:Object = {};
         var _loc20_:Array = [];
         var _loc22_:Array = [];
         for each(_loc3_ in _loc15_)
         {
            if(!(_loc3_.charAt(0) == "#" || _loc3_.length == 0))
            {
               _loc7_ = _loc3_.split(/\s+/);
               if(_loc7_.length != 0)
               {
                  _loc8_ = _loc7_.shift();
                  if(_loc8_.length != 0)
                  {
                     switch(_loc8_)
                     {
                        case "v":
                           if(_loc7_.length != 3)
                           {
                              return;
                           }
                           _loc16_.push(_loc7_);
                           continue;
                        case "vt":
                           if(_loc7_.length != 2)
                           {
                              return;
                           }
                           _loc17_.push(_loc7_);
                           continue;
                        case "f":
                           if(_loc7_.length < 3)
                           {
                              return;
                           }
                           _loc20_.push(_loc7_);
                           _loc22_.push(_loc21_);
                           for each(_loc9_ in _loc7_)
                           {
                              if(!_loc19_.hasOwnProperty(_loc9_))
                              {
                                 _loc19_[_loc9_] = _loc18_.length;
                                 _loc18_.push(_loc9_);
                              }
                           }
                           continue;
                        case "usemtl":
                           if(_loc7_.length != 1)
                           {
                              return;
                           }
                           _loc21_ = _loc7_[0];
                           continue;
                        default:
                           continue;
                     }
                  }
                  else
                  {
                     continue;
                  }
               }
               else
               {
                  continue;
               }
            }
            else
            {
               continue;
            }
         }
         _loc4_ = new _1aW_();
         for each(_loc5_ in _loc18_)
         {
            _loc10_ = _loc5_.split("/");
            ConversionUtil._1I_A_(_loc16_[int(_loc10_[0]) - 1],_loc4_.vL_);
            if(_loc10_.length > 1 && _loc10_[1].length > 0)
            {
               ConversionUtil._1I_A_(_loc17_[int(_loc10_[1]) - 1],_loc4_.uvts_);
               _loc4_.uvts_.push(0);
            }
            else
            {
               _loc4_.uvts_.push(0,0,0);
            }
         }
         _loc6_ = 0;
         while(_loc6_ < _loc20_.length)
         {
            _loc11_ = _loc20_[_loc6_];
            _loc12_ = _loc22_[_loc6_];
            _loc13_ = new Vector.<int>();
            _loc14_ = 0;
            while(_loc14_ < _loc11_.length)
            {
               _loc13_.push(_loc19_[_loc11_[_loc14_]]);
               _loc14_++;
            }
            _loc4_.faces_.push(new com.company.assembleegameclient.engine3d._py(_loc4_,_loc13_,_loc12_ == null || _loc12_.substr(0,5) != "Solid"));
            _loc6_++;
         }
         _loc4_._03O_();
         _cZ_[param1] = _loc4_;
      }
      
      public static function _wU_(param1:String) : _1aW_
      {
         return _cZ_[param1];
      }
      
      public static function _N_T_(param1:String) : _1ee
      {
         var _loc2_:_1aW_ = _cZ_[param1];
         if(_loc2_ == null)
         {
            return null;
         }
         return new _1ee(_loc2_);
      }
      
      public static function _05M_(param1:String) : Object3D
      {
         var _loc2_:_1S_3 = _1J_a[param1];
         if(_loc2_ == null)
         {
            return null;
         }
         return new Object3D(_loc2_);
      }
      
      public function toString() : String
      {
         var _loc1_:* = "";
         _loc1_ = _loc1_ + ("vL(" + this.vL_.length + "): " + this.vL_.join() + "\n");
         _loc1_ = _loc1_ + ("uvts(" + this.uvts_.length + "): " + this.uvts_.join() + "\n");
         return _loc1_ + ("faces_(" + this.faces_.length + "): " + this.faces_.join() + "\n");
      }
      
      public function _03O_() : void
      {
         this.faces_.sort(com.company.assembleegameclient.engine3d._py._zg);
      }
   }
}
