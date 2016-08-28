package _0B_y
{
   import flash.utils.Dictionary;
   import flash.utils.ByteArray;
   import flash.utils.getTimer;
   import flash.utils.Endian;
   
   public class AGALMiniAssembler
   {
      
      private static const _0F_H_:Dictionary = new Dictionary();
      
      private static const _107:Dictionary = new Dictionary();
      
      private static const _1p8:Dictionary = new Dictionary();
      
      private static const _1sP_:int = 4;
      
      private static const _const:int = 256;
      
      private static const FRAGMENT:String = "fragment";
      
      private static const VERTEX:String = "vertex";
      
      private static const _0P_:uint = 12;
      
      private static const _0R_3:uint = 16;
      
      private static const _1mj:uint = 20;
      
      private static const _0T_4:uint = 24;
      
      private static const _0vG_:uint = 28;
      
      private static const _1I_W_:uint = 1;
      
      private static const _m7:uint = 2;
      
      private static const _I_t:uint = 32;
      
      private static const _0G_a:uint = 64;
      
      private static const _1iC_:uint = 1;
      
      private static const _1H_2:uint = 2;
      
      private static const _0le:uint = 4;
      
      private static const _1tu:uint = 8;
      
      private static const _0cv:uint = 16;
      
      private static const _0W_k:uint = 32;
      
      private static const _0t5:uint = 64;
      
      private static const _1L_T_:uint = 128;
      
      private static const _1zY_:String = "mov";
      
      private static const _0C_d:String = "add";
      
      private static const _0S_j:String = "sub";
      
      private static const _8h:String = "mul";
      
      private static const _e5:String = "div";
      
      private static const _11t:String = "rcp";
      
      private static const _0Y_K_:String = "min";
      
      private static const _05Y_:String = "max";
      
      private static const _0F_T_:String = "frc";
      
      private static const _0J_d:String = "sqt";
      
      private static const _0L_0:String = "rsq";
      
      private static const _1iF_:String = "pow";
      
      private static const _7k:String = "log";
      
      private static const _0eo:String = "exp";
      
      private static const _11g:String = "nrm";
      
      private static const _1wd:String = "sin";
      
      private static const _0sd:String = "cos";
      
      private static const _0K_P_:String = "crs";
      
      private static const DP3:String = "dp3";
      
      private static const DP4:String = "dp4";
      
      private static const _12q:String = "abs";
      
      private static const _U_X_:String = "neg";
      
      private static const _1E_c:String = "sat";
      
      private static const M33:String = "m33";
      
      private static const M44:String = "m44";
      
      private static const M34:String = "m34";
      
      private static const _1a5:String = "ifz";
      
      private static const _1U_x:String = "inz";
      
      private static const _oC_:String = "ife";
      
      private static const _0hu:String = "ine";
      
      private static const _0G_q:String = "ifg";
      
      private static const _0Y_e:String = "ifl";
      
      private static const _0e3:String = "ieg";
      
      private static const _1__l:String = "iel";
      
      private static const _1vB_:String = "els";
      
      private static const _0vU_:String = "eif";
      
      private static const _tc:String = "rep";
      
      private static const _0bG_:String = "erp";
      
      private static const _H_d:String = "brk";
      
      private static const _1fY_:String = "kil";
      
      private static const _0U_2:String = "tex";
      
      private static const _1H_g:String = "sge";
      
      private static const _1W_K_:String = "slt";
      
      private static const _1__Z_:String = "sgn";
      
      private static const _0nk:String = "va";
      
      private static const _0pl:String = "vc";
      
      private static const _15Y_:String = "vt";
      
      private static const _Z_k:String = "op";
      
      private static const V:String = "v";
      
      private static const _hv:String = "fc";
      
      private static const _0H_7:String = "ft";
      
      private static const _1J_X_:String = "fs";
      
      private static const _0C_U_:String = "oc";
      
      private static const D2:String = "2d";
      
      private static const D3:String = "3d";
      
      private static const _12k:String = "cube";
      
      private static const _jr:String = "mipnearest";
      
      private static const _1z1:String = "miplinear";
      
      private static const _1fN_:String = "mipnone";
      
      private static const _0W_F_:String = "nomip";
      
      private static const _1sR_:String = "nearest";
      
      private static const LINEAR:String = "linear";
      
      private static const _V_D_:String = "centroid";
      
      private static const _1V_H_:String = "single";
      
      private static const _O_C_:String = "depth";
      
      private static const _1q2:String = "repeat";
      
      private static const _0R_i:String = "wrap";
      
      private static const _0A_0:String = "clamp";
      
      private static var initialized:Boolean = false;
       
      
      private var _I_e:ByteArray = null;
      
      private var _08J_:String = "";
      
      private var _1dz:Boolean = false;
      
      public function AGALMiniAssembler(param1:Boolean = false)
      {
         super();
         this._1dz = param1;
         if(!initialized)
         {
            init();
         }
      }
      
      private static function init() : void
      {
         initialized = true;
         _0F_H_[_1zY_] = new OpCode(_1zY_,2,0,0);
         _0F_H_[_0C_d] = new OpCode(_0C_d,3,1,0);
         _0F_H_[_0S_j] = new OpCode(_0S_j,3,2,0);
         _0F_H_[_8h] = new OpCode(_8h,3,3,0);
         _0F_H_[_e5] = new OpCode(_e5,3,4,0);
         _0F_H_[_11t] = new OpCode(_11t,2,5,0);
         _0F_H_[_0Y_K_] = new OpCode(_0Y_K_,3,6,0);
         _0F_H_[_05Y_] = new OpCode(_05Y_,3,7,0);
         _0F_H_[_0F_T_] = new OpCode(_0F_T_,2,8,0);
         _0F_H_[_0J_d] = new OpCode(_0J_d,2,9,0);
         _0F_H_[_0L_0] = new OpCode(_0L_0,2,10,0);
         _0F_H_[_1iF_] = new OpCode(_1iF_,3,11,0);
         _0F_H_[_7k] = new OpCode(_7k,2,12,0);
         _0F_H_[_0eo] = new OpCode(_0eo,2,13,0);
         _0F_H_[_11g] = new OpCode(_11g,2,14,0);
         _0F_H_[_1wd] = new OpCode(_1wd,2,15,0);
         _0F_H_[_0sd] = new OpCode(_0sd,2,16,0);
         _0F_H_[_0K_P_] = new OpCode(_0K_P_,3,17,0);
         _0F_H_[DP3] = new OpCode(DP3,3,18,0);
         _0F_H_[DP4] = new OpCode(DP4,3,19,0);
         _0F_H_[_12q] = new OpCode(_12q,2,20,0);
         _0F_H_[_U_X_] = new OpCode(_U_X_,2,21,0);
         _0F_H_[_1E_c] = new OpCode(_1E_c,2,22,0);
         _0F_H_[M33] = new OpCode(M33,3,23,_0cv);
         _0F_H_[M44] = new OpCode(M44,3,24,_0cv);
         _0F_H_[M34] = new OpCode(M34,3,25,_0cv);
         _0F_H_[_1a5] = new OpCode(_1a5,1,26,_1L_T_ | _1H_2 | _1iC_);
         _0F_H_[_1U_x] = new OpCode(_1U_x,1,27,_1L_T_ | _1H_2 | _1iC_);
         _0F_H_[_oC_] = new OpCode(_oC_,2,28,_1L_T_ | _1H_2 | _1iC_);
         _0F_H_[_0hu] = new OpCode(_0hu,2,29,_1L_T_ | _1H_2 | _1iC_);
         _0F_H_[_0G_q] = new OpCode(_0G_q,2,30,_1L_T_ | _1H_2 | _1iC_);
         _0F_H_[_0Y_e] = new OpCode(_0Y_e,2,31,_1L_T_ | _1H_2 | _1iC_);
         _0F_H_[_0e3] = new OpCode(_0e3,2,32,_1L_T_ | _1H_2 | _1iC_);
         _0F_H_[_1__l] = new OpCode(_1__l,2,33,_1L_T_ | _1H_2 | _1iC_);
         _0F_H_[_1vB_] = new OpCode(_1vB_,0,34,_1L_T_ | _1H_2 | _0le);
         _0F_H_[_0vU_] = new OpCode(_0vU_,0,35,_1L_T_ | _0le);
         _0F_H_[_tc] = new OpCode(_tc,1,36,_1L_T_ | _1H_2 | _1iC_);
         _0F_H_[_0bG_] = new OpCode(_0bG_,0,37,_1L_T_ | _0le);
         _0F_H_[_H_d] = new OpCode(_H_d,0,38,_1L_T_);
         _0F_H_[_1fY_] = new OpCode(_1fY_,1,39,_1L_T_ | _0W_k);
         _0F_H_[_0U_2] = new OpCode(_0U_2,3,40,_0W_k | _1tu);
         _0F_H_[_1H_g] = new OpCode(_1H_g,3,41,0);
         _0F_H_[_1W_K_] = new OpCode(_1W_K_,3,42,0);
         _0F_H_[_1__Z_] = new OpCode(_1__Z_,2,43,0);
         _107[_0nk] = new Register(_0nk,"vertex attribute",0,7,_0G_a | _m7);
         _107[_0pl] = new Register(_0pl,"vertex constant",1,127,_0G_a | _m7);
         _107[_15Y_] = new Register(_15Y_,"vertex temporary",2,7,_0G_a | _1I_W_ | _m7);
         _107[_Z_k] = new Register(_Z_k,"vertex output",3,0,_0G_a | _1I_W_);
         _107[V] = new Register(V,"varying",4,7,_0G_a | _I_t | _m7 | _1I_W_);
         _107[_hv] = new Register(_hv,"fragment constant",1,27,_I_t | _m7);
         _107[_0H_7] = new Register(_0H_7,"fragment temporary",2,7,_I_t | _1I_W_ | _m7);
         _107[_1J_X_] = new Register(_1J_X_,"texture sampler",5,7,_I_t | _m7);
         _107[_0C_U_] = new Register(_0C_U_,"fragment output",3,0,_I_t | _1I_W_);
         _1p8[D2] = new Sampler(D2,_0P_,0);
         _1p8[D3] = new Sampler(D3,_0P_,2);
         _1p8[_12k] = new Sampler(_12k,_0P_,1);
         _1p8[_jr] = new Sampler(_jr,_0T_4,1);
         _1p8[_1z1] = new Sampler(_1z1,_0T_4,2);
         _1p8[_1fN_] = new Sampler(_1fN_,_0T_4,0);
         _1p8[_0W_F_] = new Sampler(_0W_F_,_0T_4,0);
         _1p8[_1sR_] = new Sampler(_1sR_,_0vG_,0);
         _1p8[LINEAR] = new Sampler(LINEAR,_0vG_,1);
         _1p8[_V_D_] = new Sampler(_V_D_,_0R_3,1 << 0);
         _1p8[_1V_H_] = new Sampler(_1V_H_,_0R_3,1 << 1);
         _1p8[_O_C_] = new Sampler(_O_C_,_0R_3,1 << 2);
         _1p8[_1q2] = new Sampler(_1q2,_1mj,1);
         _1p8[_0R_i] = new Sampler(_0R_i,_1mj,1);
         _1p8[_0A_0] = new Sampler(_0A_0,_1mj,0);
      }
      
      public function get error() : String
      {
         return this._08J_;
      }
      
      public function get _1r0() : ByteArray
      {
         return this._I_e;
      }
      
      public function _11r(param1:String, param2:String, param3:Boolean = false) : ByteArray
      {
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Array = null;
         var _loc9_:Array = null;
         var _loc10_:OpCode = null;
         var _loc11_:Array = null;
         var _loc12_:Boolean = false;
         var _loc13_:uint = 0;
         var _loc14_:uint = 0;
         var _loc15_:int = 0;
         var _loc16_:Boolean = false;
         var _loc17_:Array = null;
         var _loc18_:Array = null;
         var _loc19_:Register = null;
         var _loc20_:Array = null;
         var _loc21_:uint = 0;
         var _loc22_:uint = 0;
         var _loc23_:Array = null;
         var _loc24_:Boolean = false;
         var _loc25_:Boolean = false;
         var _loc26_:uint = 0;
         var _loc27_:uint = 0;
         var _loc28_:int = 0;
         var _loc29_:uint = 0;
         var _loc30_:uint = 0;
         var _loc31_:int = 0;
         var _loc32_:Array = null;
         var _loc33_:Register = null;
         var _loc34_:Array = null;
         var _loc35_:Array = null;
         var _loc36_:uint = 0;
         var _loc37_:uint = 0;
         var _loc38_:Number = NaN;
         var _loc39_:Sampler = null;
         var _loc40_:* = null;
         var _loc41_:uint = 0;
         var _loc42_:uint = 0;
         var _loc43_:String = null;
         var _loc45_:Boolean = false;
         var _loc47_:int = 0;
         var _loc48_:int = 0;
         var _loc44_:uint = getTimer();
         this._I_e = new ByteArray();
         this._08J_ = "";
         if(param1 == FRAGMENT)
         {
            _loc45_ = true;
         }
         else if(param1 != VERTEX)
         {
            this._08J_ = "ERROR: mode needs to be \"" + FRAGMENT + "\" or \"" + VERTEX + "\" but is \"" + param1 + "\".";
         }
         this._1r0.endian = Endian.LITTLE_ENDIAN;
         this._1r0.writeByte(160);
         this._1r0.writeUnsignedInt(1);
         this._1r0.writeByte(161);
         this._1r0.writeByte(!!_loc45_?1:0);
         var _loc46_:Array = param2.replace(/[\f\n\r\v]+/g,"\n").split("\n");
         var _loc49_:int = _loc46_.length;
         _loc4_ = 0;
         while(_loc4_ < _loc49_ && this._08J_ == "")
         {
            _loc5_ = new String(_loc46_[_loc4_]);
            _loc6_ = _loc5_.search("//");
            if(_loc6_ != -1)
            {
               _loc5_ = _loc5_.slice(0,_loc6_);
            }
            _loc7_ = _loc5_.search(/<.*>/g);
            if(_loc7_ != -1)
            {
               _loc8_ = _loc5_.slice(_loc7_).match(/([\w\.\-\+]+)/gi);
               _loc5_ = _loc5_.slice(0,_loc7_);
            }
            _loc9_ = _loc5_.match(/^\w{3}/ig);
            _loc10_ = _0F_H_[_loc9_[0]];
            if(!this._1dz)
            {
            }
            if(_loc10_ == null)
            {
               if(_loc5_.length >= 3)
               {
               }
            }
            else
            {
               _loc5_ = _loc5_.slice(_loc5_.search(_loc10_.name) + _loc10_.name.length);
               if(_loc10_.flags & _0le)
               {
                  if(--_loc47_ < 0)
                  {
                     this._08J_ = "error: conditional closes without open.";
                     break;
                  }
               }
               if(_loc10_.flags & _1H_2)
               {
                  if(++_loc47_ > _1sP_)
                  {
                     this._08J_ = "error: nesting to deep, maximum allowed is " + _1sP_ + ".";
                     break;
                  }
               }
               if(_loc10_.flags & _0W_k && !_loc45_)
               {
                  this._08J_ = "error: opcode is only allowed in fragment programs.";
                  break;
               }
               if(!param3)
               {
               }
               this._1r0.writeUnsignedInt(_loc10_.emitCode);
               if(++_loc48_ > _const)
               {
                  this._08J_ = "error: too many opcodes. maximum is " + _const + ".";
                  break;
               }
               _loc11_ = _loc5_.match(/vc\[([vof][actps]?)(\d*)?(\.[xyzw](\+\d{1,3})?)?\](\.[xyzw]{1,4})?|([vof][actps]?)(\d*)?(\.[xyzw]{1,4})?/gi);
               if(_loc11_.length != _loc10_.numRegister)
               {
                  this._08J_ = "error: wrong number of operands. found " + _loc11_.length + " but expected " + _loc10_.numRegister + ".";
                  break;
               }
               _loc12_ = false;
               _loc13_ = 64 + 64 + 32;
               _loc14_ = _loc11_.length;
               _loc15_ = 0;
               while(_loc15_ < _loc14_)
               {
                  _loc16_ = false;
                  _loc17_ = _loc11_[_loc15_].match(/\[.*\]/ig);
                  if(_loc17_.length > 0)
                  {
                     _loc11_[_loc15_] = _loc11_[_loc15_].replace(_loc17_[0],"0");
                     if(!param3)
                     {
                     }
                     _loc16_ = true;
                  }
                  _loc18_ = _loc11_[_loc15_].match(/^\b[A-Za-z]{1,2}/ig);
                  _loc19_ = _107[_loc18_[0]];
                  if(!this._1dz)
                  {
                  }
                  if(_loc19_ == null)
                  {
                     this._08J_ = "error: could not parse operand " + _loc15_ + " (" + _loc11_[_loc15_] + ").";
                     _loc12_ = true;
                     break;
                  }
                  if(_loc45_)
                  {
                     if(!(_loc19_.flags & _I_t))
                     {
                        this._08J_ = "error: register operand " + _loc15_ + " (" + _loc11_[_loc15_] + ") only allowed in vertex programs.";
                        _loc12_ = true;
                        break;
                     }
                     if(_loc16_)
                     {
                        this._08J_ = "error: register operand " + _loc15_ + " (" + _loc11_[_loc15_] + ") relative adressing not allowed in fragment programs.";
                        _loc12_ = true;
                        break;
                     }
                  }
                  else if(!(_loc19_.flags & _0G_a))
                  {
                     this._08J_ = "error: register operand " + _loc15_ + " (" + _loc11_[_loc15_] + ") only allowed in fragment programs.";
                     _loc12_ = true;
                     break;
                  }
                  _loc11_[_loc15_] = _loc11_[_loc15_].slice(_loc11_[_loc15_].search(_loc19_.name) + _loc19_.name.length);
                  _loc20_ = !!_loc16_?_loc17_[0].match(/\d+/):_loc11_[_loc15_].match(/\d+/);
                  _loc21_ = 0;
                  if(_loc20_)
                  {
                     _loc21_ = uint(_loc20_[0]);
                  }
                  if(_loc19_.range < _loc21_)
                  {
                     this._08J_ = "error: register operand " + _loc15_ + " (" + _loc11_[_loc15_] + ") index exceeds limit of " + (_loc19_.range + 1) + ".";
                     _loc12_ = true;
                     break;
                  }
                  _loc22_ = 0;
                  _loc23_ = _loc11_[_loc15_].match(/(\.[xyzw]{1,4})/);
                  _loc24_ = _loc15_ == 0 && !(_loc10_.flags & _1L_T_);
                  _loc25_ = _loc15_ == 2 && _loc10_.flags & _1tu;
                  _loc26_ = 0;
                  _loc27_ = 0;
                  _loc28_ = 0;
                  if(_loc24_ && _loc16_)
                  {
                     this._08J_ = "error: relative can not be destination";
                     _loc12_ = true;
                     break;
                  }
                  if(_loc23_)
                  {
                     _loc22_ = 0;
                     _loc30_ = _loc23_[0].length;
                     _loc31_ = 1;
                     while(_loc31_ < _loc30_)
                     {
                        _loc29_ = _loc23_[0].charCodeAt(_loc31_) - "x".charCodeAt(0);
                        if(_loc29_ > 2)
                        {
                           _loc29_ = 3;
                        }
                        if(_loc24_)
                        {
                           _loc22_ = _loc22_ | 1 << _loc29_;
                        }
                        else
                        {
                           _loc22_ = _loc22_ | _loc29_ << (_loc31_ - 1 << 1);
                        }
                        _loc31_++;
                     }
                     if(!_loc24_)
                     {
                        while(_loc31_ <= 4)
                        {
                           _loc22_ = _loc22_ | _loc29_ << (_loc31_ - 1 << 1);
                           _loc31_++;
                        }
                     }
                  }
                  else
                  {
                     _loc22_ = !!_loc24_?uint(15):uint(228);
                  }
                  if(_loc16_)
                  {
                     _loc32_ = _loc17_[0].match(/[A-Za-z]{1,2}/ig);
                     _loc33_ = _107[_loc32_[0]];
                     if(_loc33_ == null)
                     {
                        this._08J_ = "error: bad index register";
                        _loc12_ = true;
                        break;
                     }
                     _loc26_ = _loc33_.emitCode;
                     _loc34_ = _loc17_[0].match(/(\.[xyzw]{1,1})/);
                     if(_loc34_.length == 0)
                     {
                        this._08J_ = "error: bad index register select";
                        _loc12_ = true;
                        break;
                     }
                     _loc27_ = _loc34_[0].charCodeAt(1) - "x".charCodeAt(0);
                     if(_loc27_ > 2)
                     {
                        _loc27_ = 3;
                     }
                     _loc35_ = _loc17_[0].match(/\+\d{1,3}/ig);
                     if(_loc35_.length > 0)
                     {
                        _loc28_ = _loc35_[0];
                     }
                     if(_loc28_ < 0 || _loc28_ > 255)
                     {
                        this._08J_ = "error: index offset " + _loc28_ + " out of bounds. [0..255]";
                        _loc12_ = true;
                        break;
                     }
                     if(!param3)
                     {
                     }
                  }
                  if(!param3)
                  {
                  }
                  if(_loc24_)
                  {
                     this._1r0.writeShort(_loc21_);
                     this._1r0.writeByte(_loc22_);
                     this._1r0.writeByte(_loc19_.emitCode);
                     _loc13_ = _loc13_ - 32;
                  }
                  else if(_loc25_)
                  {
                     if(!param3)
                     {
                     }
                     _loc36_ = 5;
                     _loc37_ = _loc8_.length;
                     _loc38_ = 0;
                     _loc31_ = 0;
                     while(_loc31_ < _loc37_)
                     {
                        if(!param3)
                        {
                        }
                        _loc39_ = _1p8[_loc8_[_loc31_]];
                        if(_loc39_ == null)
                        {
                           _loc38_ = Number(_loc8_[_loc31_]);
                           if(!param3)
                           {
                           }
                        }
                        else
                        {
                           if(_loc39_.flag != _0R_3)
                           {
                              _loc36_ = _loc36_ & ~(15 << _loc39_.flag);
                           }
                           _loc36_ = _loc36_ | uint(_loc39_.mask) << uint(_loc39_.flag);
                        }
                        _loc31_++;
                     }
                     this._1r0.writeShort(_loc21_);
                     this._1r0.writeByte(int(_loc38_ * 8));
                     this._1r0.writeByte(0);
                     this._1r0.writeUnsignedInt(_loc36_);
                     if(!param3)
                     {
                     }
                     _loc13_ = _loc13_ - 64;
                  }
                  else
                  {
                     if(_loc15_ == 0)
                     {
                        this._1r0.writeUnsignedInt(0);
                        _loc13_ = _loc13_ - 32;
                     }
                     this._1r0.writeShort(_loc21_);
                     this._1r0.writeByte(_loc28_);
                     this._1r0.writeByte(_loc22_);
                     this._1r0.writeByte(_loc19_.emitCode);
                     this._1r0.writeByte(_loc26_);
                     this._1r0.writeShort(!!_loc16_?_loc27_ | 1 << 15:0);
                     _loc13_ = _loc13_ - 64;
                  }
                  _loc15_++;
               }
               _loc15_ = 0;
               while(_loc15_ < _loc13_)
               {
                  this._1r0.writeByte(0);
                  _loc15_ = _loc15_ + 8;
               }
               if(_loc12_)
               {
                  break;
               }
            }
            _loc4_++;
         }
         if(this._08J_ != "")
         {
            this._08J_ = this._08J_ + ("\n  at line " + _loc4_ + " " + _loc46_[_loc4_]);
            this._1r0.length = 0;
         }
         if(this._1dz)
         {
            _loc40_ = "generated bytecode:";
            _loc41_ = this._1r0.length;
            _loc42_ = 0;
            while(_loc42_ < _loc41_)
            {
               if(!(_loc42_ % 16))
               {
                  _loc40_ = _loc40_ + "\n";
               }
               if(!(_loc42_ % 4))
               {
                  _loc40_ = _loc40_ + " ";
               }
               _loc43_ = this._1r0[_loc42_].toString(16);
               if(_loc43_.length < 2)
               {
                  _loc43_ = "0" + _loc43_;
               }
               _loc40_ = _loc40_ + _loc43_;
               _loc42_++;
            }
         }
         if(!param3)
         {
         }
         return this._1r0;
      }
   }
}

class OpCode
{
    
   
   private var _emitCode:uint;
   
   private var _flags:uint;
   
   private var _name:String;
   
   private var _numRegister:uint;
   
   function OpCode(param1:String, param2:uint, param3:uint, param4:uint)
   {
      super();
      this._name = param1;
      this._numRegister = param2;
      this._emitCode = param3;
      this._flags = param4;
   }
   
   public function get emitCode() : uint
   {
      return this._emitCode;
   }
   
   public function get flags() : uint
   {
      return this._flags;
   }
   
   public function get name() : String
   {
      return this._name;
   }
   
   public function get numRegister() : uint
   {
      return this._numRegister;
   }
   
   public function toString() : String
   {
      return "[OpCode name=\"" + this._name + "\", numRegister=" + this._numRegister + ", emitCode=" + this._emitCode + ", flags=" + this._flags + "]";
   }
}

class Register
{
    
   
   private var _emitCode:uint;
   
   private var _name:String;
   
   private var _longName:String;
   
   private var _flags:uint;
   
   private var _range:uint;
   
   function Register(param1:String, param2:String, param3:uint, param4:uint, param5:uint)
   {
      super();
      this._name = param1;
      this._longName = param2;
      this._emitCode = param3;
      this._range = param4;
      this._flags = param5;
   }
   
   public function get emitCode() : uint
   {
      return this._emitCode;
   }
   
   public function get longName() : String
   {
      return this._longName;
   }
   
   public function get name() : String
   {
      return this._name;
   }
   
   public function get flags() : uint
   {
      return this._flags;
   }
   
   public function get range() : uint
   {
      return this._range;
   }
   
   public function toString() : String
   {
      return "[Register name=\"" + this._name + "\", longName=\"" + this._longName + "\", emitCode=" + this._emitCode + ", range=" + this._range + ", flags=" + this._flags + "]";
   }
}

class Sampler
{
    
   
   private var _flag:uint;
   
   private var _mask:uint;
   
   private var _name:String;
   
   function Sampler(param1:String, param2:uint, param3:uint)
   {
      super();
      this._name = param1;
      this._flag = param2;
      this._mask = param3;
   }
   
   public function get flag() : uint
   {
      return this._flag;
   }
   
   public function get mask() : uint
   {
      return this._mask;
   }
   
   public function get name() : String
   {
      return this._name;
   }
   
   public function toString() : String
   {
      return "[Sampler name=\"" + this._name + "\", flag=\"" + this._flag + "\", mask=" + this.mask + "]";
   }
}
