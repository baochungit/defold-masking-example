varying highp vec2 var_texcoord0;
varying lowp vec4 var_color;

uniform lowp sampler2D texture_sampler;
uniform lowp sampler2D mask_texture;
uniform lowp vec4 mask_position;

void main()
{
    vec4 tex = texture2D(texture_sampler, var_texcoord0.xy);
    vec4 masky = texture2D(mask_texture, var_texcoord0.xy - mask_position.xy);
    float alpha_mul = 1.0 - var_color.w * (1.0 - masky.a);

    tex *= (alpha_mul * masky.r * var_color.w);
    gl_FragColor = tex * var_color;
}
